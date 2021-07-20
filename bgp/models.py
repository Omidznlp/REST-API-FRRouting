from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator

ADDR_TYPE = (
    ("unicast", "unicast"),
    ("multicast", "multicast"),
    ("none", "none")
)
REDISTRIBUTE = (
    ("connected", "connected"),
    ("ospf", "ospf"),
    ("static", "static"),
    ("rip", "rip")
)
COMMUNITY = (
    ("all", "all"),
    ("both", "both"),
    ("extended", "extended"),
    ("large", "large"),
    ("standard", "standard"),
    ("none", "none")
)
IN_OUT = (
    ("in", "in"),
    ("out", "out")
)


# Create your models here.
class Bgp(models.Model):
    ADDR_TYPE = (
        ("unicast", "unicast"),
        ("multicast", "multicast"),
        ("none", "none")
    )
    # "as" which means As number
    as_number = models.IntegerField(validators=[MinValueValidator(1),
                                                MaxValueValidator(4294967295)])
    router_id = models.GenericIPAddressField(null=True)
    neighbor_addr = models.GenericIPAddressField(null=True)
    neighbor_interface_name = models.CharField(null=True, max_length=200)
    remote_as_num = models.IntegerField(validators=[MinValueValidator(1),
                                                    MaxValueValidator(4294967295)], null=True)
    remote_as_internal = models.BooleanField(null=True)
    remote_as_external = models.BooleanField(null=True)


class BgpAddrFamily(models.Model):
    as_number = models.IntegerField(validators=[MinValueValidator(1),
                                                MaxValueValidator(4294967295)])
    type_addr_family = models.CharField(null=True, choices=ADDR_TYPE, max_length=200)
    aggregate_address = models.GenericIPAddressField(null=True)
    aggregate_address_prefix = models.IntegerField(validators=[MinValueValidator(0),
                                                               MaxValueValidator(32)], null=True)
    aggregate_address_as_set = models.BooleanField(null=True)
    aggregate_address_routemap = models.CharField(null=True, max_length=200)
    aggregate_address_summery_only = models.BooleanField(null=True)
    distance_admin = models.IntegerField(validators=[MinValueValidator(1),
                                                     MaxValueValidator(255)], null=True)
    distance_admin_ip = models.GenericIPAddressField(null=True)
    distance_admin_prefix = models.IntegerField(validators=[MinValueValidator(0),
                                                            MaxValueValidator(32)], null=True)
    distance_external_routes = models.IntegerField(validators=[MinValueValidator(1),
                                                               MaxValueValidator(255)], null=True)
    distance_internal_routes = models.IntegerField(validators=[MinValueValidator(1),
                                                               MaxValueValidator(255)], null=True)
    distance_local_routes = models.IntegerField(validators=[MinValueValidator(1),
                                                            MaxValueValidator(255)], null=True)
    maximum_paths = models.IntegerField(validators=[MinValueValidator(1),
                                                    MaxValueValidator(64)], null=True)
    maximum_paths_ibgp = models.IntegerField(validators=[MinValueValidator(1),
                                                         MaxValueValidator(64)], null=True)
    network_addr = models.GenericIPAddressField(null=True)
    network_addr_prefix = models.IntegerField(validators=[MinValueValidator(0),
                                                          MaxValueValidator(32)], null=True)
    network_route_map = models.CharField(null=True, max_length=200)
    redistribute = models.CharField(null=True, choices=REDISTRIBUTE, max_length=200)
    neighbor_addr = models.GenericIPAddressField(null=True)
    neighbor_interface_name = models.CharField(null=True, max_length=200)
    neighbor_addpath_tx_all_paths = models.BooleanField(null=True)
    neighbor_addpath_tx_bestpath_per_as = models.BooleanField(null=True)
    neighbor_allowas_in = models.BooleanField(null=True)
    neighbor_allowas_in_origin = models.BooleanField(null=True)
    neighbor_as_override = models.BooleanField(null=True)
    neighbor_attribute_unchanged_all = models.BooleanField(null=True)
    neighbor_attribute_unchanged_as_path = models.BooleanField(null=True)
    neighbor_attribute_unchanged_med = models.BooleanField(null=True)
    neighbor_attribute_unchanged_nexthop = models.BooleanField(null=True)
    neighbor_default_originate = models.BooleanField(null=True)
    neighbor_default_originate_routemap = models.CharField(null=True, max_length=200)
    neighbor_distribute_list_num = models.IntegerField(validators=[MinValueValidator(1),
                                                                   MaxValueValidator(199)],
                                                       null=True)
    neighbor_distribute_list_expanded = models.IntegerField(
        validators=[MinValueValidator(1300), MaxValueValidator(2699)], null=True)
    neighbor_distribute_list_in_out = models.CharField(null=True, choices=IN_OUT, max_length=200)
    neighbor_prefix_list = models.CharField(null=True, max_length=200)
    neighbor_prefix_list_in_out = models.CharField(null=True, choices=IN_OUT, max_length=200)
    neighbor_route_map = models.CharField(null=True, max_length=200)
    neighbor_route_map_in_out = models.CharField(null=True, choices=IN_OUT, max_length=200)
    neighbor_send_community = models.CharField(null=True, choices=COMMUNITY, max_length=200)


class BgpGlobal(models.Model):
    as_number = models.IntegerField(validators=[MinValueValidator(1),
                                                MaxValueValidator(4294967295)])
    neighbor_addr = models.GenericIPAddressField(null=True)
    neighbor_interface_name = models.CharField(null=True, max_length=200)
    neighbor_update_source_addr = models.GenericIPAddressField(null=True)
    neighbor_update_source_interface_name = models.CharField(null=True, max_length=200)
    neighbor_ebgp_multihop = models.BooleanField(null=True)
    neighbor_ebgp_multihop_numhop = models.IntegerField(validators=[MinValueValidator(1),
                                                                    MaxValueValidator(255)],
                                                        null=True)
    neighbor_shutdown = models.BooleanField(null=True)
    neighbor_keepalive = models.IntegerField(validators=[MinValueValidator(0),
                                                         MaxValueValidator(65535)], null=True)
    neighbor_holdtime = models.IntegerField(validators=[MinValueValidator(0),
                                                        MaxValueValidator(65535)], null=True)
    neighbor_connect_timer = models.IntegerField(validators=[MinValueValidator(0),
                                                             MaxValueValidator(65535)], null=True)
    neighbor_password = models.CharField(null=True, max_length=200)
    neighbor_passive = models.BooleanField(null=True)
    neighbor_ttl_security = models.IntegerField(validators=[MinValueValidator(1),
                                                            MaxValueValidator(255)], null=True)
    timer_keepalive = models.IntegerField(validators=[MinValueValidator(0),
                                                      MaxValueValidator(65535)], null=True)
    timer_holdtime = models.IntegerField(validators=[MinValueValidator(0),
                                                     MaxValueValidator(65535)], null=True)
    update_delay = models.IntegerField(validators=[MinValueValidator(0),
                                                   MaxValueValidator(3600)], null=True)
