from rest_framework import serializers
from rip import models



class RipSerializer(serializers.Serializer):
    network_addr = serializers.IPAddressField(required=False)
    network_prefix = serializers.IntegerField(min_value=1, max_value=32, required=False)
    network_interface_name = serializers.CharField(required=False, max_length=200)
    version = serializers.IntegerField(min_value=1, max_value=2, required=False)

    def create(self, validated_data):
        rip = models.Rip.objects.create(
            network_addr=validated_data.get("network_addr"),
            network_prefix=validated_data.get("network_prefix"),
            network_interface_name=validated_data.get("network_interface_name"),
            version=validated_data.get("version")
        )
        return rip

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance



class RipAdvancedSerializer(serializers.Serializer):
    neighbor = serializers.IPAddressField(required=False)
    passive_interface = serializers.CharField(required=False, max_length=200)
    allow_ecmp = serializers.BooleanField(required=False)
    default_info_originate = serializers.BooleanField(required=False)
    redistribute = serializers.ChoiceField(required=False,
                                           choices=models.REDISTRIBUTE)
    default_metric = serializers.IntegerField(min_value=1, max_value=16, required=False)
    distance = serializers.IntegerField(min_value=1,
                                        max_value=255, required=False)
    distribute_list_perfix_in_out = serializers.ChoiceField(required=False, choices=models.IN_OUT)
    timers_update_time = serializers.IntegerField(min_value=5,
                                                  max_value=2147483647,
                                                  required=False)
    timers_time_out = serializers.IntegerField(min_value=5,
                                               max_value=2147483647, required=False)
    timers_garbage_time = serializers.IntegerField(min_value=5, max_value=2147483647,
                                                   required=False)
    interface_name = serializers.CharField(required=False)
    interface_auth_key_chain = serializers.CharField(required=False)
    interface_auth_mode_md5 = serializers.CharField(required=False)
    interface_auth_mode_text = serializers.CharField(required=False)
    interface_receive_version = serializers.ChoiceField(required=False,
                                                        choices=models.IN_OUT_NONE)
    interface_send_version = serializers.ChoiceField(required=False,
                                                     choices=models.IN_OUT_NONE)

    def create(self, validated_data):
        rip_advanced = models.RipAdvanced.objects.create(
            neighbor=validated_data.get("neighbor"),
            passive_interface=validated_data.get("passive_interface"),
            allow_ecmp=validated_data.get("allow_ecmp"),
            default_info_originate=validated_data.get("default_info_originate"),
            redistribute=validated_data.get("redistribute"),
            default_metric=validated_data.get("default_metric"),
            distance=validated_data.get("distance"),
            distribute_list_perfix_in_out=validated_data.get("distribute_list_perfix_in_out"),
            timers_update_time=validated_data.get("timers_update_time"),
            timers_time_out=validated_data.get("timers_time_out"),
            timers_garbage_time=validated_data.get("timers_garbage_time"),
            interface_name=validated_data.get("interface_name"),
            interface_auth_key_chain=validated_data.get("interface_auth_key_chain"),
            interface_auth_mode_md5=validated_data.get("interface_auth_mode_md5"),
            interface_auth_mode_text=validated_data.get("interface_auth_mode_text"),
            interface_receive_version=validated_data.get("interface_receive_version"),
            interface_send_version=validated_data.get("interface_send_version")
        )
        return rip_advanced

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance
