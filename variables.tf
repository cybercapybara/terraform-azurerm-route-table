variable "name" {
  description = "Name of the route table."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the route table."
  type        = string
}

variable "location" {
  description = "Azure region in which to create the route table."
  type        = string
}

variable "bgp_route_propagation_enabled" {
  description = "Whether to propagate routes learned by BGP on the route table."
  type        = bool
  default     = true
}

variable "routes" {
  description = "List of routes applied to the route table. next_hop_in_ip_address is only used when next_hop_type is VirtualAppliance."
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string, null)
  }))
  default = []
}

variable "tags" {
  description = "Map of tags applied to the route table."
  type        = map(string)
  default     = {}
}
