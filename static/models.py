from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator


# Create your models here.
class Static(models.Model):
    ip_dst = models.GenericIPAddressField(null=True)
    ip_dst_prefix = models.IntegerField(validators=[MinValueValidator(1),
                                                    MaxValueValidator(32)], null=True)
    gateway = models.GenericIPAddressField(null=True)
    interface_gateway = models.CharField(null=True, max_length=200)
    null_interface = models.BooleanField(null=True)
    distance = models.IntegerField(validators=[MinValueValidator(1),
                                               MaxValueValidator(255)], null=True)
    reject = models.BooleanField(null=True)
