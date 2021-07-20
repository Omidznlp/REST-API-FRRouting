from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator

IN_OUT = (
    ("in", "in"),
    ("out", "out")
)

IN_OUT_NONE = (
    ("1", "1"),
    ("2", "2"),
    ("none", "none")
)
REDISTRIBUTE = (
    ("connected", "connected"),
    ("bgp", "bgp"),
    ("static", "static"),
    ("ospf", "ospf")
)


# Create your models here.
class Rip(models.Model):
    network_addr = models.GenericIPAddressField(null=True)
    network_prefix = models.IntegerField(validators=[MinValueValidator(1),
                                                     MaxValueValidator(32)], null=True)
    network_interface_name = models.CharField(null=True, max_length=200)
    version = models.IntegerField(validators=[MinValueValidator(1),
                                              MaxValueValidator(2)], null=True)


class RipAdvanced(models.Model):
    neighbor = models.GenericIPAddressField(null=True)
    passive_interface = models.CharField(null=True, max_length=200)
    allow_ecmp = models.BooleanField(null=True)
    default_info_originate = models.BooleanField(null=True)
    redistribute = models.CharField(null=True, choices=REDISTRIBUTE, max_length=200)
    default_metric = models.IntegerField(validators=[MinValueValidator(1),
                                                     MaxValueValidator(16)], null=True)
    distance = models.IntegerField(validators=[MinValueValidator(1),
                                               MaxValueValidator(255)], null=True)
    distribute_list_perfix_in_out = models.CharField(null=True,
                                                     choices=IN_OUT, max_length=200)
    timers_update_time = models.IntegerField(validators=[MinValueValidator(5),
                                                         MaxValueValidator(2147483647)],
                                             null=True)
    timers_time_out = models.IntegerField(validators=[MinValueValidator(5),
                                                      MaxValueValidator(2147483647)], null=True)
    timers_garbage_time = models.IntegerField(validators=[MinValueValidator(5),
                                                          MaxValueValidator(2147483647)],
                                              null=True)
    interface_name = models.CharField(null=True, max_length=200)
    interface_auth_key_chain = models.CharField(null=True, max_length=200)
    interface_auth_string = models.CharField(null=True, max_length=200)
    interface_auth_mode_md5 = models.BooleanField(null=True)
    interface_auth_mode_text = models.BooleanField(null=True)
    interface_receive_version = models.CharField(null=True,
                                                 choices=IN_OUT_NONE, max_length=200)
    interface_send_version = models.CharField(null=True,
                                              choices=IN_OUT_NONE, max_length=200)
