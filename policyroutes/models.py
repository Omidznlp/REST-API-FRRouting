from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator

# Create your models here.

ACCESS_TYPE = (
    ("permit", "permit"),
    ("deny", "deny"),
)
PROTOCOL_TYPE = (
    ("bgp", "bgp"),
    ("ospf", "ospf"),
    ("rip", "rip"),
    ("ripng", "ripng"),
    ("static", "static"),
)
ORIGIN_TYPE = (
    ("egp", "egp"),
    ("igp", "igp"),
    ("incomplete", "incomplete"),
)


# Create your models here.
class Pbr(models.Model):
    nexthop_group_name = models.CharField(null=True, max_length=200)
    nexthop_ip = models.GenericIPAddressField(null=True)
    nexthop_interface = models.CharField(null=True, max_length=200)
    label = models.IntegerField(validators=[MinValueValidator(16),
                                            MaxValueValidator(1048575)], null=True)
    map_name = models.CharField(null=True, max_length=200)
    map_seq = models.IntegerField(validators=[MinValueValidator(1),
                                              MaxValueValidator(700)], primary_key=True)
    match_src_ip = models.GenericIPAddressField(null=True)
    mask_src_ip = models.IntegerField(validators=[MinValueValidator(0),
                                                  MaxValueValidator(32)], null=True)
    match_dst_ip = models.GenericIPAddressField(null=True)
    mask_dst_ip = models.IntegerField(validators=[MinValueValidator(0),
                                                  MaxValueValidator(32)], null=True)
    match_mark = models.IntegerField(validators=[MinValueValidator(1),
                                                 MaxValueValidator(4294967295)], null=True)
    set_nexthop_group_name = models.CharField(null=True, max_length=200)
    set_nexthop_ip = models.GenericIPAddressField(null=True)
    set_nexthop_interface = models.CharField(null=True, max_length=200)
    interface_name = models.CharField(null=True, max_length=200)
    apply_pbr_interface = models.CharField(null=True, max_length=200)


class RouteMapAccessList(models.Model):
    seq = models.IntegerField(validators=[MinValueValidator(1),
                                          MaxValueValidator(4294967295)], primary_key=True)
    range_standard_first = models.IntegerField(validators=[MinValueValidator(1),
                                                           MaxValueValidator(99)], null=True)
    range_standard_second = models.IntegerField(validators=[MinValueValidator(1300),
                                                            MaxValueValidator(1999)],
                                                null=True)
    range_expanded_first = models.IntegerField(validators=[MinValueValidator(100),
                                                           MaxValueValidator(199)], null=True)
    range_expanded_second = models.IntegerField(validators=[MinValueValidator(2000),
                                                            MaxValueValidator(2699)],
                                                null=True)
    action = models.CharField(choices=ACCESS_TYPE, max_length=19)
    ip_st_ex = models.GenericIPAddressField(null=True)
    prefix_st_ex = models.IntegerField(validators=[MinValueValidator(0),
                                                   MaxValueValidator(32)], null=True)
    any_all_st_ex = models.BooleanField(null=True)
    host_st = models.GenericIPAddressField(null=True)
    ip_src_ex = models.GenericIPAddressField(null=True)
    ip_src_wildcard_ex = models.GenericIPAddressField(null=True)
    ip_dst_ex = models.GenericIPAddressField(null=True)
    ip_dst_wildcard_ex = models.GenericIPAddressField(null=True)
    ip_any_src_ex = models.BooleanField(null=True)
    ip_any_dst_ex = models.BooleanField(null=True)
    ip_host_src_ex = models.GenericIPAddressField(null=True)
    ip_host_dst_ex = models.GenericIPAddressField(null=True)


class RouteMapPreFixList(models.Model):
    seq = models.IntegerField(validators=[MinValueValidator(1),
                                          MaxValueValidator(4294967295)], primary_key=True)
    name = models.CharField(null=False, max_length=200)
    action = models.CharField(choices=ACCESS_TYPE, max_length=19)
    ip = models.GenericIPAddressField(null=True)
    prefix = models.IntegerField(validators=[MinValueValidator(0),
                                             MaxValueValidator(32)], null=True)
    le = models.IntegerField(validators=[MinValueValidator(0),
                                         MaxValueValidator(32)], null=True)
    ge = models.IntegerField(validators=[MinValueValidator(0),
                                         MaxValueValidator(32)], null=True)


class RouteMap(models.Model):
    seq = models.IntegerField(validators=[MinValueValidator(1),
                                          MaxValueValidator(65535)], primary_key=True)
    name = models.CharField(null=True, max_length=200)
    action = models.CharField(choices=ACCESS_TYPE, max_length=20)
    match_accesslist_num = models.IntegerField(validators=[MinValueValidator(1),
                                                           MaxValueValidator(200)], null=True)
    match_accesslist_expanded = models.IntegerField(validators=[MinValueValidator(1300),
                                                                MaxValueValidator(2699)],
                                                    null=True)
    match_prefix_len = models.IntegerField(validators=[MinValueValidator(0),
                                                       MaxValueValidator(32)], null=True)
    match_prefix_list = models.CharField(null=True, max_length=200)
    match_nexthop_accesslist_num = models.IntegerField(validators=[MinValueValidator(1),
                                                                   MaxValueValidator(200)],
                                                       null=True)
    match_nexthop_accesslist_expanded = models.IntegerField(
        validators=[MinValueValidator(1300), MaxValueValidator(2699)], null=True)
    match_nexthop_prefix_len = models.IntegerField(validators=[MinValueValidator(0),
                                                               MaxValueValidator(32)], null=True)
    match_nexthop_prefix_list = models.CharField(null=True, max_length=200)
    match_as_path = models.CharField(null=True, max_length=200)
    match_community_name = models.CharField(null=True, max_length=200)
    match_community_standard = models.IntegerField(validators=[MinValueValidator(1),
                                                               MaxValueValidator(99)], null=True)
    match_community_expanded = models.IntegerField(validators=[MinValueValidator(100),
                                                               MaxValueValidator(500)],
                                                   null=True)
    match_metric = models.IntegerField(validators=[MinValueValidator(0),
                                                   MaxValueValidator(4294967295)], null=True)
    match_tag = models.CharField(null=True, max_length=200)
    match_local_preference = models.IntegerField(validators=[MinValueValidator(0),
                                                             MaxValueValidator(4294967295)],
                                                 null=True)
    match_peer_ip = models.GenericIPAddressField(null=True)
    match_peer_interface = models.CharField(null=False, max_length=200)
    match_source_protocol = models.CharField(choices=PROTOCOL_TYPE, max_length=20)
    match_source_instance = models.IntegerField(validators=[MinValueValidator(0),
                                                            MaxValueValidator(255)], null=True)
    match_origin = models.CharField(choices=ORIGIN_TYPE, max_length=20)
    set_tag = models.IntegerField(validators=[MinValueValidator(1),
                                              MaxValueValidator(4294967295)], null=True)
    set_ip_nexthop = models.GenericIPAddressField(null=True)
    set_nexthop_peer_addr_bgp = models.BooleanField(null=True)
    set_nexthop_unchanged = models.BooleanField(null=True)
    # Set the BGP local preference to local_pref
    set_local_preference = models.IntegerField(validators=[MinValueValidator(0),
                                                           MaxValueValidator(4294967295)],
                                               null=True)
    # Add the BGP local preference to an existing local_pref.
    set_local_preference_add = models.IntegerField(validators=[MinValueValidator(0),
                                                               MaxValueValidator(4294967295)],
                                                   null=True)
    # Subtract the BGP local preference from an existing local_pre
    set_local_preference_sub = models.IntegerField(validators=[MinValueValidator(0),
                                                               MaxValueValidator(4294967295)],
                                                   null=True)
    set_distance = models.IntegerField(validators=[MinValueValidator(0),
                                                   MaxValueValidator(255)],
                                       null=True)
    set_as_path_bgp_exclude = models.IntegerField(validators=[MinValueValidator(1),
                                                              MaxValueValidator(4294967295)],
                                                  null=True)
    set_as_path_bgp_prepend = models.IntegerField(validators=[MinValueValidator(1),
                                                              MaxValueValidator(4294967295)],
                                                  null=True)
    set_community_name = models.CharField(null=True, max_length=200)
    set_metric = models.IntegerField(validators=[MinValueValidator(0),
                                                 MaxValueValidator(4294967295)], null=True)
    set_origin = models.CharField(choices=ORIGIN_TYPE, max_length=20)
    set_aggregator_num = models.IntegerField(validators=[MinValueValidator(1),
                                                         MaxValueValidator(4294967295)],
                                             null=True)
    set_aggregator_ip = models.GenericIPAddressField(null=True)
    call = models.CharField(null=True, max_length=200)
    continue_seq = models.IntegerField(validators=[MinValueValidator(1),
                                                   MaxValueValidator(65535)], null=True)
