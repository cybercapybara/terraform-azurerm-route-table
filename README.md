# terraform-azurerm-route-table

Terraform module that manages an [Azure](https://azure.microsoft.com/) route
table. Custom routes are supplied as a list and rendered through a dynamic
block, letting you steer subnet traffic to virtual appliances, gateways or the
internet without changing the module.

## Usage

```hcl
module "route_table" {
  source = "github.com/cybercapybara/terraform-azurerm-route-table"

  name                = "egress-rt"
  resource_group_name = "prod-rg"
  location            = "eastus"

  routes = [
    {
      name                   = "default-to-firewall"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.0.0.4"
    }
  ]

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| azurerm   | >= 3.0   |

## Inputs

| Name                            | Description                                                     | Type           | Default | Required |
|---------------------------------|-----------------------------------------------------------------|----------------|---------|:--------:|
| `name`                          | Name of the route table.                                        | `string`       | n/a     |   yes    |
| `resource_group_name`           | Name of the resource group in which to create the route table.  | `string`       | n/a     |   yes    |
| `location`                      | Azure region in which to create the route table.                | `string`       | n/a     |   yes    |
| `bgp_route_propagation_enabled` | Whether to propagate routes learned by BGP on the route table.  | `bool`         | `true`  |    no    |
| `routes`                        | List of routes applied to the route table.                      | `list(object)` | `[]`    |    no    |
| `tags`                          | Map of tags applied to the route table.                         | `map(string)`  | `{}`    |    no    |

## Outputs

| Name      | Description                                        |
|-----------|----------------------------------------------------|
| `id`      | ID of the route table.                             |
| `name`    | Name of the route table.                           |
| `subnets` | IDs of the subnets associated with the route table.|

## License

[MIT](LICENSE)
