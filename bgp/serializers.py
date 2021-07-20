from rest_framework import serializers
from bgp import models

class BgpSerializer(serializers.Serializer):
    # "as" which means As number
    as_number = serializers.IntegerField(min_value=1, max_value=4294967295, required=True)
    router_id = serializers.IPAddressField(required=False)
    neighbor_addr = serializers.IPAddressField(required=False)
    neighbor_interface_name = serializers.CharField(required=False)
    remote_as_num = serializers.IntegerField(min_value=1, max_value=4294967295, required=False)
    remote_as_internal = serializers.BooleanField(required=False)
    remote_as_external = serializers.BooleanField(required=False)

    def create(self, validated_data):
        bgp = models.Bgp.objects.create(
            as_number=validated_data.get("as_number"),
            router_id=validated_data.get("router_id"),
            neighbor_addr=validated_data.get("neighbor_addr"),
            neighbor_interface_name=validated_data.get("neighbor_interface_name"),
            remote_as_num=validated_data.get("remote_as_num"),
            remote_as_internal=validated_data.get("remote_as_internal"),
            remote_as_external=validated_data.get("remote_as_external")
        )
        return bgp

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance



class BgpAddrFamilySerializer(serializers.Serializer):
    as_number = serializers.IntegerField(min_value=1, max_value=4294967295, required=True)
    type_addr_family = serializers.ChoiceField(required=False, choices=models.ADDR_TYPE)
    aggregate_address = serializers.IPAddressField(required=False)
    aggregate_address_prefix = serializers.IntegerField(min_value=0, max_value=32, required=False)
    aggregate_address_as_set = serializers.BooleanField(required=False)
    aggregate_address_routemap = serializers.CharField(required=False)
    aggregate_address_summery_only = serializers.BooleanField(required=False)
    distance_admin = serializers.IntegerField(min_value=1, max_value=255, required=False)
    distance_admin_ip = serializers.IPAddressField(required=False)
    distance_admin_prefix = serializers.IntegerField(min_value=0, max_value=32, required=False)
    distance_external_routes = serializers.IntegerField(min_value=1, max_value=255, required=False)
    distance_internal_routes = serializers.IntegerField(min_value=1, max_value=255, required=False)
    distance_local_routes = serializers.IntegerField(min_value=1, max_value=255, required=False)
    maximum_paths = serializers.IntegerField(min_value=1, max_value=64, required=False)
    maximum_paths_ibgp = serializers.IntegerField(min_value=1, max_value=64, required=False)
    network_addr = serializers.IPAddressField(required=False)
    network_addr_prefix = serializers.IntegerField(min_value=0, max_value=32, required=False)
    network_route_map = serializers.CharField(required=False)
    redistribute = serializers.ChoiceField(required=False, choices=models.REDISTRIBUTE)
    neighbor_addr = serializers.IPAddressField(required=False)
    neighbor_interface_name = serializers.CharField(required=False)
    neighbor_addpath_tx_all_paths = serializers.BooleanField(required=False)
    neighbor_addpath_tx_bestpath_per_as = serializers.BooleanField(required=False)
    neighbor_allowas_in = serializers.BooleanField(required=False)
    neighbor_allowas_in_origin = serializers.BooleanField(required=False)
    neighbor_as_override = serializers.BooleanField(required=False)
    neighbor_attribute_unchanged_all = serializers.BooleanField(required=False)
    neighbor_attribute_unchanged_as_path = serializers.BooleanField(required=False)
    neighbor_attribute_unchanged_med = serializers.BooleanField(required=False)
    neighbor_attribute_unchanged_nexthop = serializers.BooleanField(required=False)
    neighbor_default_originate = serializers.BooleanField(required=False)
    neighbor_default_originate_routemap = serializers.CharField(required=False)
    neighbor_distribute_list_num = serializers.IntegerField(min_value=1, max_value=199,
                                                            required=False)
    neighbor_distribute_list_expanded = serializers.IntegerField(min_value=1300,
                                                                 max_value=2699, required=False)
    neighbor_distribute_list_in_out = serializers.ChoiceField(required=False, choices=models.IN_OUT)
    neighbor_prefix_list = serializers.CharField(required=False)
    neighbor_prefix_list_in_out = serializers.ChoiceField(required=False, choices=models.IN_OUT)
    neighbor_route_map = serializers.CharField(required=False)
    neighbor_route_map_in_out = serializers.ChoiceField(required=False, choices=models.IN_OUT)
    neighbor_send_community = serializers.ChoiceField(required=False, choices=models.COMMUNITY)

    def create(self, validated_data):
        bgp_addr_family = models.BgpAddrFamily.objects.create(
            as_number=validated_data.get("as_number"),
            type_addr_family=validated_data.get("type_addr_family"),
            aggregate_address=validated_data.get("aggregate_address"),
            aggregate_address_prefix=validated_data.get("aggregate_address_prefix"),
            aggregate_address_as_set=validated_data.get("aggregate_address_as_set"),
            aggregate_address_routemap=validated_data.get("aggregate_address_routemap"),
            aggregate_address_summery_only=validated_data.get("aggregate_address_summery_only"),
            distance_admin=validated_data.get("distance_admin"),
            distance_admin_ip=validated_data.get("distance_admin_ip"),
            distance_admin_prefix=validated_data.get("distance_admin_prefix"),
            distance_external_routes=validated_data.get("distance_external_routes"),
            distance_internal_routes=validated_data.get("distance_internal_routes"),
            distance_local_routes=validated_data.get("distance_local_routes"),
            maximum_paths=validated_data.get("maximum_paths"),
            maximum_paths_ibgp=validated_data.get("maximum_paths_ibgp"),
            network_addr=validated_data.get("network_addr"),
            network_addr_prefix=validated_data.get("network_addr_prefix"),
            network_route_map=validated_data.get("network_route_map"),
            redistribute=validated_data.get("redistribute"),
            neighbor_addr=validated_data.get("neighbor_addr"),
            neighbor_interface_name=validated_data.get("neighbor_interface_name"),
            neighbor_addpath_tx_all_paths=validated_data.get("neighbor_addpath_tx_all_paths"),
            neighbor_addpath_tx_bestpath_per_as=validated_data.get(
                "neighbor_addpath_tx_bestpath_per_as"),
            neighbor_allowas_in=validated_data.get("neighbor_allowas_in"),
            neighbor_allowas_in_origin=validated_data.get("neighbor_allowas_in_origin"),
            neighbor_as_override=validated_data.get("neighbor_as_override"),
            neighbor_attribute_unchanged_all=validated_data.get("neighbor_attribute_unchanged_all"),
            neighbor_attribute_unchanged_as_path=validated_data.get(
                "neighbor_attribute_unchanged_as_path"),
            neighbor_attribute_unchanged_med=validated_data.get("neighbor_attribute_unchanged_med"),
            neighbor_attribute_unchanged_nexthop=validated_data.get(
                "neighbor_attribute_unchanged_nexthop"),
            neighbor_default_originate=validated_data.get("neighbor_default_originate"),
            neighbor_default_originate_routemap=validated_data.get(
                "neighbor_default_originate_routemap"),
            neighbor_distribute_list_num=validated_data.get("neighbor_distribute_list_num"),
            neighbor_distribute_list_expanded=validated_data.get(
                "neighbor_distribute_list_expanded"),
            neighbor_distribute_list_in_out=validated_data.get("neighbor_distribute_list_in_out"),
            neighbor_prefix_list=validated_data.get("neighbor_prefix_list"),
            neighbor_prefix_list_in_out=validated_data.get("neighbor_prefix_list_in_out"),
            neighbor_route_map=validated_data.get("neighbor_route_map"),
            neighbor_route_map_in_out=validated_data.get("neighbor_route_map_in_out"),
            neighbor_send_community=validated_data.get("neighbor_send_community")

        )
        return bgp_addr_family

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance


class BgpGlobalSerializer(serializers.Serializer):
    as_number = serializers.IntegerField(min_value=1, max_value=4294967295, required=True)
    neighbor_addr = serializers.IPAddressField(required=False)
    neighbor_interface_name = serializers.CharField(required=False)
    neighbor_update_source_addr = serializers.IPAddressField(required=False)
    neighbor_update_source_interface_name = serializers.CharField(required=False)
    neighbor_ebgp_multihop = serializers.BooleanField(required=False)
    neighbor_ebgp_multihop_numhop = serializers.IntegerField(min_value=1, max_value=255,
                                                             required=False)
    neighbor_shutdown = serializers.BooleanField(required=False)
    neighbor_keepalive = serializers.IntegerField(min_value=0, max_value=65535, required=False)
    neighbor_holdtime = serializers.IntegerField(min_value=0, max_value=65535, required=False)
    neighbor_connect_timer = serializers.IntegerField(min_value=0, max_value=65535, required=False)
    neighbor_password = serializers.CharField(required=False)
    neighbor_passive = serializers.BooleanField(required=False)
    neighbor_ttl_security = serializers.IntegerField(min_value=1, max_value=255, required=False)
    timer_keepalive = serializers.IntegerField(min_value=0, max_value=65535, required=False)
    timer_holdtime = serializers.IntegerField(min_value=0, max_value=65535, required=False)
    update_delay = serializers.IntegerField(min_value=0, max_value=3600, required=False)

    def create(self, validated_data):
        bgp_global = models.BgpGlobal.objects.create(
            as_number=validated_data.get("as_number"),
            neighbor_addr=validated_data.get("neighbor_addr"),
            neighbor_interface_name=validated_data.get("neighbor_interface_name"),
            neighbor_update_source_addr=validated_data.get("neighbor_update_source_addr"),
            neighbor_update_source_interface_name=validated_data.get(
                "neighbor_update_source_interface_name"),
            neighbor_ebgp_multihop=validated_data.get("neighbor_ebgp_multihop"),
            neighbor_ebgp_multihop_numhop=validated_data.get("neighbor_ebgp_multihop_numhop"),
            neighbor_shutdown=validated_data.get("neighbor_shutdown"),
            neighbor_keepalive=validated_data.get("neighbor_keepalive"),
            neighbor_holdtime=validated_data.get("neighbor_holdtime"),
            neighbor_connect_timer=validated_data.get("neighbor_connect_timer"),
            neighbor_password=validated_data.get("neighbor_password"),
            neighbor_passive=validated_data.get("neighbor_passive"),
            neighbor_ttl_security=validated_data.get("neighbor_ttl_security"),
            timer_keepalive=validated_data.get("timer_keepalive"),
            timer_holdtime=validated_data.get("timer_holdtime"),
            update_delay=validated_data.get("update_delay")
        )
        return bgp_global

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance
