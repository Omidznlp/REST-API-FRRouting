from rest_framework import serializers
from static import models


class StaticSerializer(serializers.Serializer):
    ip_dst = serializers.IPAddressField(required=False)
    ip_dst_prefix = serializers.IntegerField(min_value=1, max_value=32, required=False)
    gateway = serializers.IPAddressField(required=False)
    interface_gateway = serializers.CharField(required=False)
    null_interface = serializers.BooleanField(required=False)
    distance = serializers.IntegerField(min_value=1, max_value=255, required=False)
    reject = serializers.BooleanField(required=False)

    def create(self, validated_data):
        static = models.Static.objects.create(
            ip_dst=validated_data.get("ip_dst"),
            ip_dst_prefix=validated_data.get("ip_dst_prefix"),
            interface_gateway=validated_data.get("name_gateway"),
            null_interface=validated_data.get("null_interface"),
            distance=validated_data.get("distance"),
            reject=validated_data.get("reject")
        )
        return static

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance
