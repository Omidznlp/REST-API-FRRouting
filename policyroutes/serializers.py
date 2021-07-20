from rest_framework import serializers
from policyroutes import models




class PbrSerializer(serializers.Serializer):
    nexthop_group_name = serializers.CharField(required=False)
    nexthop_ip = serializers.IPAddressField(required=False)
    nexthop_interface = serializers.CharField(required=False)
    label = serializers.IntegerField(min_value=16, max_value=1048575, required=False)
    map_name = serializers.CharField(required=False)
    map_seq = serializers.IntegerField(min_value=1, max_value=700, required=True)
    match_src_ip = serializers.IPAddressField(required=False)
    mask_src_ip = serializers.IntegerField(min_value=1, max_value=700, required=False)
    match_dst_ip = serializers.IPAddressField(required=False)
    mask_dst_ip = serializers.IntegerField(min_value=1, max_value=700, required=False)
    match_mark = serializers.IntegerField(min_value=1, max_value=4294967295, required=False)
    set_nexthop_group_name = serializers.CharField(required=False)
    set_nexthop_ip = serializers.IPAddressField(required=False)
    set_nexthop_interface = serializers.CharField(required=False)
    apply_pbr_interface = serializers.CharField(required=False)

    def create(self, validated_data):
        pbr = models.Pbr.objects.create(
            nexthop_group_name=validated_data.get("nexthop_group_name"),
            nexthop_ip=validated_data.get("nexthop_ip"),
            nexthop_interface=validated_data.get("nexthop_interface"),
            label=validated_data.get("label"),
            map_name=validated_data.get("map_name"),
            map_seq=validated_data.get("map_seq"),
            match_src_ip=validated_data.get("match_src_ip"),
            mask_src_ip=validated_data.get("mask_src_ip"),
            match_dst_ip=validated_data.get("match_dst_ip"),
            mask_dst_ip=validated_data.get("mask_dst_ip"),
            match_mark=validated_data.get("match_mark"),
            set_nexthop_group_name=validated_data.get("set_nexthop_group_name"),
            set_nexthop_ip=validated_data.get("set_nexthop_ip"),
            set_nexthop_interface=validated_data.get("set_nexthop_interface"),
            apply_pbr_interface=validated_data.get("apply_pbr_interface")
        )
        return pbr

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance


class RouteMapAccessListSerializer(serializers.Serializer):
    seq = serializers.IntegerField(min_value=1, max_value=4294967295, required=True)
    range_standard_first = serializers.IntegerField(min_value=1, max_value=99, required=False)
    range_standard_second = serializers.IntegerField(min_value=1300, max_value=1999, required=False)
    range_expanded_first = serializers.IntegerField(min_value=100, max_value=199, required=False)
    range_expanded_second = serializers.IntegerField(min_value=2000, max_value=2699, required=False)
    action = serializers.ChoiceField(choices=models.ACCESS_TYPE, required=False)
    ip_st_ex = serializers.IPAddressField(required=False)
    prefix_st_ex = serializers.IntegerField(min_value=0, max_value=32, required=False)
    any_all_st_ex = serializers.BooleanField(required=False)
    host_st = serializers.IPAddressField(required=False)
    ip_src_ex = serializers.IPAddressField(required=False)
    ip_src_wildcard_ex = serializers.IPAddressField(required=False)
    ip_dst_ex = serializers.IPAddressField(required=False)
    ip_dst_wildcard_ex = serializers.IPAddressField(required=False)
    ip_any_src_ex = serializers.BooleanField(required=False)
    ip_any_dst_ex = serializers.BooleanField(required=False)
    ip_host_src_ex = serializers.IPAddressField(required=False)
    ip_host_dst_ex = serializers.IPAddressField(required=False)

    def create(self, validated_data):
        access_list = models.RouteMapAccessList.objects.create(
            seq=validated_data.get("seq"),
            range_standard_first=validated_data.get("range_standard_first"),
            range_standard_second=validated_data.get("range_standard_second"),
            range_expanded_first=validated_data.get("range_expanded_first"),
            range_expanded_second=validated_data.get("range_expanded_second"),
            action=validated_data.get("action"),
            ip_st_ex=validated_data.get("ip_st_ex"),
            prefix_st_ex=validated_data.get("prefix_st_ex"),
            any_all_st_ex=validated_data.get("any_all_st_ex"),
            host_st=validated_data.get("host_st"),
            ip_src_ex=validated_data.get("ip_src_ex"),
            ip_src_wildcard_ex=validated_data.get("ip_src_wildcard_ex"),
            ip_dst_ex=validated_data.get("ip_dst_ex"),
            ip_dst_wildcard_ex=validated_data.get("ip_dst_wildcard_ex"),
            ip_any_src_ex=validated_data.get("ip_any_src_ex"),
            ip_any_dst_ex=validated_data.get("ip_any_dst_ex"),
            ip_host_src_ex=validated_data.get("ip_host_src_ex"),
            ip_host_dst_ex=validated_data.get("ip_host_dst_ex")
        )
        return access_list

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance


class RouteMapPreFixListSerializer(serializers.Serializer):
    name = serializers.CharField(required=True)
    seq = serializers.IntegerField(min_value=1, max_value=4294967295, required=True)
    action = serializers.ChoiceField(choices=models.ACCESS_TYPE, required=False)
    ip = serializers.IPAddressField(required=False)
    prefix = serializers.IntegerField(min_value=0, max_value=32, required=False)
    le = serializers.IntegerField(min_value=0, max_value=32, required=False)
    ge = serializers.IntegerField(min_value=0, max_value=32, required=False)

    def create(self, validated_data):
        prefix_list = models.RouteMapPreFixList.objects.create(
            name=validated_data.get("name"),
            seq=validated_data.get("seq"),
            action=validated_data.get("action"),
            ip=validated_data.get("ip"),
            prefix=validated_data.get("prefix"),
            le=validated_data.get("le"),
            ge=validated_data.get("ge")

        )
        return prefix_list

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance


class RouteMapSerializer(serializers.Serializer):
    seq = serializers.IntegerField(min_value=1, max_value=65535, required=True)
    name = serializers.CharField(required=True)
    action = serializers.ChoiceField(choices=models.ACCESS_TYPE, required=False)
    match_accesslist_num = serializers.IntegerField(min_value=1, max_value=200, required=False)
    match_accesslist_expanded = serializers.IntegerField(min_value=1300, max_value=2699,
                                                         required=False)
    match_prefix_len = serializers.IntegerField(min_value=0, max_value=32, required=False)
    match_prefix_list = serializers.CharField(required=False)
    match_nexthop_accesslist_num = serializers.IntegerField(min_value=1, max_value=200,
                                                            required=False)
    match_nexthop_accesslist_expanded = serializers.IntegerField(
        min_value=1300, max_value=2699, required=False)
    match_nexthop_prefix_len = serializers.IntegerField(min_value=0, max_value=32,
                                                        required=False)
    match_nexthop_prefix_list = serializers.CharField(required=False)
    match_as_path = serializers.CharField(required=False)
    match_community_name = serializers.CharField(required=False)
    match_community_standard = serializers.IntegerField(min_value=1, max_value=99, required=False)
    match_community_expanded = serializers.IntegerField(min_value=100, max_value=500,
                                                        required=False)
    match_metric = serializers.IntegerField(min_value=0, max_value=4294967295, required=False)
    match_tag = serializers.CharField(required=False)
    match_local_preference = serializers.IntegerField(min_value=0,
                                                      max_value=4294967295, required=False)
    match_peer_ip = serializers.IPAddressField(required=False)
    match_peer_interface = serializers.CharField(required=False)
    match_source_protocol = serializers.ChoiceField(choices=models.PROTOCOL_TYPE, required=False)
    match_source_instance = serializers.IntegerField(min_value=0, max_value=255, required=False)
    match_origin = serializers.ChoiceField(choices=models.ORIGIN_TYPE, required=False)
    set_tag = serializers.IntegerField(min_value=1, max_value=4294967295, required=False)
    set_ip_nexthop = serializers.IPAddressField(required=False)
    set_nexthop_peer_addr_bgp = serializers.BooleanField(required=False)
    set_nexthop_unchanged = serializers.BooleanField(required=False)
    # Set the BGP local preference to local_pref
    set_local_preference = serializers.IntegerField(min_value=0,
                                                    max_value=4294967295, required=False)
    # Add the BGP local preference to an existing local_pref.
    set_local_preference_add = serializers.IntegerField(min_value=0, max_value=4294967295,
                                                        required=False)
    # Subtract the BGP local preference from an existing local_pre
    set_local_preference_sub = serializers.IntegerField(min_value=0, max_value=4294967295,
                                                        required=False)
    set_distance = serializers.IntegerField(min_value=0, max_value=255,
                                            required=False)
    set_as_path_bgp_exclude = serializers.IntegerField(min_value=1,
                                                       max_value=4294967295, required=False)
    set_as_path_bgp_prepend = serializers.IntegerField(min_value=1,
                                                       max_value=4294967295, required=False)
    set_community_name = serializers.CharField(required=False)
    set_metric = serializers.IntegerField(min_value=0,
                                          max_value=4294967295, required=False)
    set_origin = serializers.ChoiceField(choices=models.ORIGIN_TYPE, required=False)
    set_aggregator_num = serializers.IntegerField(min_value=1,
                                                  max_value=4294967295, required=False)
    set_aggregator_ip = serializers.IPAddressField(required=False)
    call = serializers.CharField(required=False)
    continue_seq = serializers.IntegerField(min_value=1,
                                            max_value=65535, required=False)

    def create(self, validated_data):
        route_map = models.RouteMap.objects.create(
            seq=validated_data.get("seq"),
            name=validated_data.get("name"),
            action=validated_data.get("action"),
            match_accesslist_num=validated_data.get("match_accesslist_num"),
            match_accesslist_expanded=validated_data.get("match_accesslist_expanded"),
            match_prefix_len=validated_data.get("match_prefix_len"),
            match_prefix_list=validated_data.get("match_prefix_list"),
            match_nexthop_accesslist_num=validated_data.get("match_nexthop_accesslist_num"),
            match_nexthop_accesslist_expanded=validated_data.get(
                "match_nexthop_accesslist_expanded"),
            match_nexthop_prefix_len=validated_data.get("match_nexthop_prefix_len"),
            match_nexthop_prefix_list=validated_data.get("match_nexthop_prefix_list"),
            match_as_path=validated_data.get("match_as_path"),
            match_community_name=validated_data.get("match_community_name"),
            match_community_standard=validated_data.get("match_community_standard"),
            match_community_expanded=validated_data.get("match_community_expanded"),
            match_metric=validated_data.get("match_metric"),
            match_tag=validated_data.get("match_tag"),
            match_local_preference=validated_data.get("match_local_preference"),
            match_peer_ip=validated_data.get("match_peer_ip"),
            match_peer_interface=validated_data.get("match_peer_interface"),
            match_source_protocol=validated_data.get("match_source_protocol"),
            match_source_instance=validated_data.get("match_source_instance"),
            match_origin=validated_data.get("match_origin"),
            set_tag=validated_data.get("set_tag"),
            set_ip_nexthop=validated_data.get("set_ip_nexthop"),
            set_nexthop_peer_addr_bgp=validated_data.get("set_nexthop_peer_addr_bgp"),
            set_nexthop_unchanged=validated_data.get("set_nexthop_unchanged"),
            set_local_preference=validated_data.get("set_local_preference"),
            set_local_preference_add=validated_data.get("set_local_preference_add"),
            set_local_preference_sub=validated_data.get("set_local_preference_sub"),
            set_distance=validated_data.get("set_distance"),
            set_as_path_bgp_exclude=validated_data.get("set_as_path_bgp_exclude"),
            set_as_path_bgp_prepend=validated_data.get("set_as_path_bgp_prepend"),
            set_community_name=validated_data.get("set_community_name"),
            set_metric=validated_data.get("set_metric"),
            set_origin=validated_data.get("set_origin"),
            call=validated_data.get("call"),
            set_aggregator_num=validated_data.get("set_aggregator_num"),
            set_aggregator_ip=validated_data.get("set_aggregator_ip"),
            continue_seq=validated_data.get("continue_seq")
        )
        return route_map

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance
