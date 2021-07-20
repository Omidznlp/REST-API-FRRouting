from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator

REDISTRIBUTE = (
    ("connected", "connected"),
    ("bgp", "bgp"),
    ("static", "static"),
    ("rip", "rip")
)

ABR_TYPE = (
    ("cisco", "cisco"),
    ("ibm", "ibm"),
    ("starndard", "standard"),
    ("shortcut", "shortcut")
)

NETWORK_TYPE = [
    ("broadcast", "broadcast"),
    ("non-broadcast", "non-broadcast"),
    ("point-to-multipoint", "point-to-multipoint"),
    ("point-to-point", "point-to-point"),
]

NSSA_TYPE = (
    ("no-summary", "no-summary"),
    ("translate-always", "translate-always"),
    ("translate-candidate", "translate-candidate"),
    ("translate-never", "translate-never"),
)


# Create your models here.
class Ospf(models.Model):
    id_instance = models.IntegerField(validators=[MinValueValidator(1),
                                                  MaxValueValidator(65535)], primary_key=True)
    router_id = models.GenericIPAddressField(null=True)
    interface_name = models.CharField(null=True, max_length=200)
    interface_area = models.IntegerField(validators=[MinValueValidator(0),
                                                     MaxValueValidator(4294967295)], null=True)


class OspfAdvInterface(models.Model):
    id_instance = models.IntegerField(validators=[MinValueValidator(1),
                                                  MaxValueValidator(65535)], primary_key=True)
    name = models.CharField(null=False, max_length=200)
    hello_interval = models.IntegerField(validators=[MinValueValidator(1),
                                                     MaxValueValidator(65535)],
                                         null=True)
    retransmit_interval = models.IntegerField(validators=[MinValueValidator(3),
                                                          MaxValueValidator(65535)],
                                              null=True)
    transmit_delay = models.IntegerField(validators=[MinValueValidator(1),
                                                     MaxValueValidator(65535)],
                                         null=True)
    dead_interval = models.IntegerField(validators=[MinValueValidator(1),
                                                    MaxValueValidator(65535)],
                                        null=True)
    cost = models.IntegerField(validators=[MinValueValidator(1),
                                           MaxValueValidator(65535)], null=True)
    priority = models.IntegerField(validators=[MinValueValidator(1),
                                               MaxValueValidator(255)], null=True)
    network_type = models.CharField(choices=NETWORK_TYPE, max_length=19)
    auth_message_digest = models.BooleanField(null=True)
    auth_key = models.CharField(null=True, max_length=200)
    message_digest_key = models.IntegerField(validators=[MinValueValidator(1),
                                                         MaxValueValidator(255)],
                                             null=True)
    md5_key = models.CharField(null=True, max_length=200)


class OspfAdvArea(models.Model):
    id_instance = models.IntegerField(validators=[MinValueValidator(1),
                                                  MaxValueValidator(65535)], primary_key=True)
    interface_area = models.IntegerField(validators=[MinValueValidator(0),
                                                     MaxValueValidator(4294967295)], null=False)
    nssa = models.CharField(null=True, choices=NSSA_TYPE, max_length=200)
    stub = models.BooleanField(null=True)
    stub_no_summery = models.BooleanField(null=True)
    default_cost = models.IntegerField(validators=[MinValueValidator(0),
                                                   MaxValueValidator(16777214)], null=True)
    auth = models.BooleanField(null=True)
    auth_message_digest = models.BooleanField(null=True)
    virtual_link = models.GenericIPAddressField(null=True)


class OspfAdvGlobal(models.Model):
    id_instance = models.IntegerField(validators=[MinValueValidator(1),
                                                  MaxValueValidator(65535)], primary_key=True)
    passive_interface = models.CharField(null=True, max_length=200)
    redistribute = models.CharField(null=True, choices=REDISTRIBUTE, max_length=200)
    default_metric = models.IntegerField(validators=[MinValueValidator(0),
                                                     MaxValueValidator(16777214)], null=True)
    timers_lsa_min_interval = models.IntegerField(validators=[MinValueValidator(0),
                                                              MaxValueValidator(600000)],
                                                  null=True)
    timers_throttle_lsa_all = models.IntegerField(validators=[MinValueValidator(0),
                                                              MaxValueValidator(5000)], null=True)
    timers_throttle_spf_delay = models.IntegerField(validators=[MinValueValidator(0),
                                                                MaxValueValidator(600000)],
                                                    null=True)
    timers_throttle_spf_initial_hold_time = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(600000)], null=True)
    timers_throttle_spf_max_hold_time = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(600000)], null=True)
    ospf_abr_type = models.CharField(null=True, choices=ABR_TYPE, max_length=200)
    max_mertic_router_lsa_on_startup = models.IntegerField(
        validators=[MinValueValidator(5), MaxValueValidator(100)],
                                                           null=True)
    max_mertic_router_lsa_on_shutdown = models.IntegerField(
        validators=[MinValueValidator(5), MaxValueValidator(100)],
                                                            null=True)
    max_mertic_router_lsa_administrative = models.BooleanField(null=True)
    neighbor = models.GenericIPAddressField(null=True)
    neighbor_poll_interval = models.IntegerField(validators=[MinValueValidator(1),
                                                             MaxValueValidator(65535)], null=True)
    neighbor_poll_interval_priority = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(255)],null=True)

    ospf_rfc1583compatibility = models.BooleanField(null=True)
    auto_cost_reference_bandwidth = models.IntegerField\
        (validators=[MinValueValidator(1), MaxValueValidator(4294967)],
                                                        null=True)
    distance = models.IntegerField(validators=[MinValueValidator(1),
                                               MaxValueValidator(255)], null=True)
    distance_ospf_inter_area = models.IntegerField(validators=[MinValueValidator(1),
                                                               MaxValueValidator(255)], null=True)
    distance_ospf_intra_area = models.IntegerField(validators=[MinValueValidator(1),
                                                               MaxValueValidator(255)], null=True)
    distance_ospf_external_area = models.IntegerField(validators=[MinValueValidator(1),
                                                                  MaxValueValidator(255)],
                                                      null=True)
    default_info_originate = models.BooleanField(null=True)
    default_info_originate_always = models.BooleanField(null=True)
    default_info_metric = models.IntegerField(validators=[MinValueValidator(0),
                                                          MaxValueValidator(16777214)], null=True)
    default_info_metric_type = models.IntegerField(validators=[MinValueValidator(1),
                                                               MaxValueValidator(2)], null=True)
    default_info_route_map = models.CharField(null=True, max_length=200)
    log_adjacency_changes = models.BooleanField(null=True)
