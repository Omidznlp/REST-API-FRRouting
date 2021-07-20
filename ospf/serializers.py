from rest_framework import serializers
from ospf import models



class OspfSerializer(serializers.Serializer):
    id_instance = serializers.IntegerField(min_value=1, max_value=65535, required=True)
    router_id = serializers.IPAddressField(required=False)
    interface_name = serializers.CharField(required=False)
    interface_area = serializers.IntegerField(min_value=0, max_value=4294967295, required=False)

    def create(self, validated_data):
        ospf = models.Ospf.objects.create(
            id_instance=validated_data.get("id_instance"),
            router_id=validated_data.get("router_id"),
            interface_name=validated_data.get("interface_name"),
            interface_area=validated_data.get("interface_area")
        )
        return ospf

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance


class OspfAdvInterfaceSerializer(serializers.Serializer):
    id_instance = serializers.IntegerField(min_value=1, max_value=65535, required=True)
    name = serializers.CharField(required=True)
    hello_interval = serializers.IntegerField(min_value=1, max_value=65535, required=False)
    retransmit_interval = serializers.IntegerField(min_value=3, max_value=65535, required=False)
    transmit_delay = serializers.IntegerField(min_value=1, max_value=65535, required=False)
    dead_interval = serializers.IntegerField(min_value=1, max_value=65535, required=False)
    cost = serializers.IntegerField(min_value=1, max_value=65535, required=False)
    priority = serializers.IntegerField(min_value=1, max_value=255, required=False)
    network_type = serializers.ChoiceField(choices=models.NETWORK_TYPE, required=False)
    auth_message_digest = serializers.BooleanField(required=False)
    auth_key = serializers.CharField(required=False)
    message_digest_key = serializers.IntegerField(min_value=1, max_value=255, required=False)
    md5_key = serializers.CharField(required=False)

    def create(self, validated_data):
        ospfinterface = models.OspfAdvInterface.objects.create(
            id_instance=validated_data.get("id_instance"),
            name=validated_data.get("name"),
            hello_interval=validated_data.get("hello_interval"),
            retransmit_interval=validated_data.get("retransmit_interval"),
            transmit_delay=validated_data.get("transmit_delay"),
            dead_interval=validated_data.get("dead_interval"),
            cost=validated_data.get("cost"),
            priority=validated_data.get("priority"),
            network_type=validated_data.get("network_type"),
            auth_message_digest=validated_data.get("auth_message_digest"),
            auth_key=validated_data.get("auth_key"),
            message_digest_key=validated_data.get("message_digest_key"),
            md5_key=validated_data.get("md5_key")

        )
        return ospfinterface

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance


class OspfAdvAreaSerializer(serializers.Serializer):
    id_instance = serializers.IntegerField(min_value=1, max_value=65535, required=True)
    interface_area = serializers.IntegerField(min_value=0, max_value=4294967295, required=True)
    nssa = serializers.ChoiceField(choices=models.NSSA_TYPE, required=False)
    stub = serializers.BooleanField(required=False)
    stub_no_summery = serializers.BooleanField(required=False)
    default_cost = serializers.IntegerField(min_value=0, max_value=16777214, required=False)
    auth = serializers.BooleanField(required=False)
    auth_message_digest = serializers.BooleanField(required=False)
    virtual_link = serializers.IPAddressField(required=False)

    def create(self, validated_data):
        ospfarea = models.OspfAdvArea.objects.create(
            id_instance=validated_data.get("id_instance"),
            interface_area=validated_data.get("interface_area"),
            nssa=validated_data.get("nssa"),
            stub=validated_data.get("stub"),
            stub_no_summery=validated_data.get("stub_no_summery"),
            default_cost=validated_data.get("default_cost"),
            auth=validated_data.get("auth"),
            auth_message_digest=validated_data.get("auth_message_digest"),
            virtual_link=validated_data.get("virtual_link")

        )
        return ospfarea

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance


class OspfAdvGlobalSerializer(serializers.Serializer):
    id_instance = serializers.IntegerField(min_value=1, max_value=65535, required=True)
    passive_interface = serializers.CharField(required=False)
    redistribute = serializers.ChoiceField(required=False, choices=models.REDISTRIBUTE)
    default_metric = serializers.IntegerField(min_value=0, max_value=16777214, required=False)
    timers_lsa_min_interval = serializers.IntegerField(min_value=0, max_value=600000,
                                                       required=False)
    timers_throttle_lsa_all = serializers.IntegerField(min_value=0, max_value=5000,
                                                       required=False)
    timers_throttle_spf_delay = serializers.IntegerField(min_value=0, max_value=600000,
                                                         required=False)
    timers_throttle_spf_initial_hold_time = serializers.IntegerField(min_value=0, max_value=600000,
                                                                     required=False)
    timers_throttle_spf_max_hold_time = serializers.IntegerField(min_value=0, max_value=600000,
                                                                 required=False)
    ospf_abr_type = serializers.ChoiceField(required=False, choices=models.ABR_TYPE)
    max_mertic_router_lsa_on_startup = serializers.IntegerField(required=False)
    max_mertic_router_lsa_on_shutdown = serializers.IntegerField(required=False)
    max_mertic_router_lsa_administrative = serializers.BooleanField(required=False)
    neighbor = serializers.IPAddressField(required=False)
    neighbor_poll_interval = serializers.IntegerField(min_value=1, max_value=65535,
                                                      required=False)
    neighbor_poll_interval_priority = serializers.IntegerField(min_value=0, max_value=255,
                                                               required=False)
    ospf_rfc1583compatibility = serializers.BooleanField(required=False)
    auto_cost_reference_bandwidth = serializers.IntegerField(
        min_value=1, max_value=4294967,
        required=False)
    distance = serializers.IntegerField(min_value=1, max_value=255, required=False)
    distance_ospf_inter_area = serializers.IntegerField(min_value=1, max_value=255,
                                                        required=False)
    distance_ospf_intra_area = serializers.IntegerField(min_value=1, max_value=255,
                                                        required=False)
    distance_ospf_external_area = serializers.IntegerField(min_value=1, max_value=255,
                                                           required=False)
    default_info_originate = serializers.BooleanField(required=False)
    default_info_originate_always = serializers.BooleanField(required=False)
    default_info_metric = serializers.IntegerField(min_value=0, max_value=16777214,
                                                   required=False)
    default_info_metric_type = serializers.IntegerField(min_value=1, max_value=2,
                                                        required=False)
    default_info_route_map = serializers.CharField(required=False)
    log_adjacency_changes = serializers.BooleanField(required=False)

    def create(self, validated_data):
        ospfglobe = models.OspfAdvGlobal.objects.create(
            id_instance=validated_data.get("id_instance"),
            passive_interface=validated_data.get("passive_interface"),
            redistribute=validated_data.get("redistribute"),
            default_metric=validated_data.get("default_metric"),
            timers_lsa_min_interval=validated_data.get("timers_lsa_min_interval"),
            timers_throttle_lsa_all=validated_data.get("timers_throttle_lsa_all"),
            timers_throttle_spf_delay=validated_data.get("timers_throttle_spf_delay"),
            timers_throttle_spf_initial_hold_time=validated_data.get(
                "timers_throttle_spf_initial_hold_time"),
            timers_throttle_spf_max_hold_time=validated_data.get(
                "timers_throttle_spf_max_hold_time"),
            ospf_abr_type=validated_data.get("ospf_abr_type"),
            max_mertic_router_lsa_on_startup=validated_data.get("max_mertic_router_lsa_on_startup"),
            max_mertic_router_lsa_on_shutdown=validated_data.get(
                "max_mertic_router_lsa_on_shutdown"),
            max_mertic_router_lsa_administrative=validated_data.get(
                "max_mertic_router_lsa_administrative"),
            neighbor=validated_data.get("neighbor"),
            neighbor_poll_interval=validated_data.get("neighbor_poll_interval"),
            neighbor_poll_interval_priority=validated_data.get("neighbor_poll_interval_priority"),
            ospf_rfc1583compatibility=validated_data.get("ospf_rfc1583compatibility"),
            auto_cost_reference_bandwidth=validated_data.get("auto_cost_reference_bandwidth"),
            distance=validated_data.get("distance"),
            distance_ospf_inter_area=validated_data.get("distance_ospf_inter_area"),
            distance_ospf_external_area=validated_data.get("distance_ospf_external_area"),
            default_info_originate=validated_data.get("default_info_originate"),
            default_info_originate_always=validated_data.get("default_info_originate_always"),
            default_info_metric=validated_data.get("default_info_metric"),
            default_info_metric_type=validated_data.get("default_info_metric_type"),
            default_info_route_map=validated_data.get("default_info_route_map"),
            log_adjacency_changes=validated_data.get("log_adjacency_changes")

        )
        return ospfglobe

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance
