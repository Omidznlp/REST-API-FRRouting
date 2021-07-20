#from django.shortcuts import render
import os
from rest_framework import status
from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView

from policyroutes import models
from policyroutes import serializers

from lib import common_func
BASE_DIRECTORY = os.path.join(os.getcwd(), "../lib")



########################## Start PBR ########################
class Pbr(APIView):
    """Policy Based Routing"""
    def get(self, request):
        """List all pbr"""
        pbr = models.Pbr.objects.all()
        serializer = serializers.PbrSerializer(pbr, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new pbr"""
        serializer = serializers.PbrSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["nexthop_interface"] !="":
            ret=common_func.check_interface_validation(
                request.data["nexthop_interface"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        if request.data["set_nexthop_interface"] !="":
            ret=common_func.check_interface_validation(
                request.data["set_nexthop_interface"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "policyroutes/shell/pbr.sh", "post",
                   request.data["nexthop_group_name"],
                   request.data["nexthop_ip"],
                   request.data["nexthop_interface"],
                   request.data["label"],
                   request.data["map_name"],
                   request.data["map_seq"],
                   request.data["match_src_ip"],
                   request.data["mask_src_ip"],
                   request.data["match_dst_ip"],
                   request.data["mask_dst_ip"],
                   request.data["match_mark"],
                   request.data["set_nexthop_group_name"],
                   request.data["set_nexthop_ip"],
                   request.data["set_nexthop_interface"],
                   request.data["apply_pbr_interface"]]
        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)
        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class PbrDetail(APIView):
    """Policy Based Routing Detail"""
    def get_obj(self, primary_key):
        """GET Policy Based Routing"""
        try:
            return models.Pbr.objects.get(pk=primary_key)
        except models.Pbr.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a pbr instance"""
        pbr = self.get_obj(primary_key)
        serializer = serializers.PbrSerializer(pbr)
        return Response(data=serializer.data)

    def delete(self, request, primary_key):
        """Delete a pbr instance"""
        pbr = self.get_obj(primary_key)
        command = ["/bin/bash", "policyroutes/shell/pbr.sh", "delete",
                   request.data["nexthop_group_name"],
                   request.data["map_name"],
                   request.data["map_seq"],
                   request.data["apply_pbr_interface"]]

        common_func.insert_cmd_shell(command)
        pbr.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )

#################### End PBR ########################

#################### Start Access List ##############

class RouteMapAccessList(APIView):
    """ Access List """
    def get(self, request):
        """List all access_list"""
        access_list = models.RouteMapAccessList.objects.all()
        serializer = serializers.RouteMapAccessListSerializer(access_list, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new access_list"""
        serializer = serializers.RouteMapAccessListSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)

        command = ["/bin/bash", "policyroutes/shell/access_list.sh", "post",
                   request.data["seq"],
                   request.data["range_standard_first"],
                   request.data["range_standard_second"],
                   request.data["range_expanded_first"],
                   request.data["range_expanded_second"],
                   request.data["action"],
                   request.data["ip_st_ex"],
                   request.data["prefix_st_ex"],
                   request.data["any_all_st_ex"],
                   request.data["host_st"],
                   request.data["ip_src_ex"],
                   request.data["ip_src_wildcard_ex"],
                   request.data["ip_dst_ex"],
                   request.data["ip_dst_wildcard_ex"],
                   request.data["ip_any_src_ex"],
                   request.data["ip_any_dst_ex"],
                   request.data["ip_host_src_ex"],
                   request.data["ip_host_dst_ex"]]
        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)
        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class RouteMapAcessListDetail(APIView):
    """ Access List Detail"""
    def get_obj(self, primary_key):
        """ GET Access List Detail"""
        try:
            return models.RouteMapAccessList.objects.get(pk=primary_key)
        except models.Pbr.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a access_list instance"""
        access_list = self.get_obj(primary_key)
        serializer = serializers.RouteMapAccessListSerializer(access_list)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a access_list instance"""
        access_list = self.get_obj(primary_key)
        serializer = serializers.RouteMapAccessListSerializer(
            instance=access_list,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)

        command = ["/bin/bash", "policyroutes/shell/access_list.sh", "put",
                   request.data["seq"],
                   request.data["range_standard_first"],
                   request.data["range_standard_second"],
                   request.data["range_expanded_first"],
                   request.data["range_expanded_second"],
                   request.data["action"],
                   request.data["ip_st_ex"],
                   request.data["prefix_st_ex"],
                   request.data["any_all_st_ex"],
                   request.data["host_st"],
                   request.data["ip_src_ex"],
                   request.data["ip_src_wildcard_ex"],
                   request.data["ip_dst_ex"],
                   request.data["ip_dst_wildcard_ex"],
                   request.data["ip_any_src_ex"],
                   request.data["ip_any_dst_ex"],
                   request.data["ip_host_src_ex"],
                   request.data["ip_host_dst_ex"]]
        common_func.insert_cmd_shell(command)
        serializer = serializers.RouteMapAccessListSerializer(access_list,
                                                              data=request.data,partial=True)

        common_func.save_serializer_put(serializer)
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a access_list instance"""
        access_list = self.get_obj(primary_key)
        command = ["/bin/bash", "policyroutes/shell/access_list.sh", "delete",
                   request.data["range_standard_first"],
                   request.data["range_standard_second"],
                   request.data["range_expanded_first"],
                   request.data["range_expanded_second"]
                   ]
        common_func.insert_cmd_shell(command)
        access_list.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )


################# End Access List #################

################# Start Prefix List ###############

class RouteMapPreFixList(APIView):
    """ PreFix List """
    def get(self, request):
        """List all prefix list"""
        prefix_list = models.RouteMapPreFixList.objects.all()
        serializer = serializers.RouteMapPreFixListSerializer(prefix_list, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new prefix list"""
        serializer = serializers.RouteMapPreFixListSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)

        command = ["/bin/bash", "policyroutes/shell/prefix_list.sh", "post",
                   request.data["seq"],
                   request.data["name"],
                   request.data["action"],
                   request.data["ip"],
                   request.data["prefix"],
                   request.data["le"],
                   request.data["ge"]]

        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)
        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class RouteMapPreFixListDetail(APIView):
    """ PreFix List Detail"""
    def get_obj(self, primary_key):
        """ GET PreFix List Detail"""
        try:
            return models.RouteMapPreFixList.objects.get(pk=primary_key)
        except models.RouteMapPreFixList.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a prefix list instance"""
        prefix_list = self.get_obj(primary_key)
        serializer = serializers.RouteMapPreFixListSerializer(prefix_list)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a prefix list instance"""
        prefix_list = self.get_obj(primary_key)
        serializer = serializers.RouteMapPreFixListSerializer(
            instance=prefix_list,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)

        command = ["/bin/bash", "policyroutes/shell/prefix_list.sh", "post",
                   request.data["seq"],
                   request.data["name"],
                   request.data["action"],
                   request.data["ip"],
                   request.data["prefix"],
                   request.data["le"],
                   request.data["ge"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.RouteMapPreFixListSerializer(prefix_list,
                                                              data=request.data,partial=True)

        common_func.save_serializer_put(serializer)
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a prefix list instance"""
        prefix_list = self.get_obj(primary_key)
        command = ["/bin/bash", "policyroutes/shell/prefix_list.sh", "delete",
                   request.data["seq"],
                   request.data["name"]]

        common_func.insert_cmd_shell(command)
        prefix_list.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )

#################### End Prefix List #################

################### Start Route Map ##################

class RouteMap(APIView):
    """ Route Map """
    def get(self, request):
        """List all route map"""
        route_map = models.RouteMap.objects.all()
        serializer = serializers.RouteMapSerializer(route_map, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new route map"""
        serializer = serializers.RouteMapSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["match_peer_interface"] !="":
            ret=common_func.check_interface_validation(
                request.data["match_peer_interface"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "policyroutes/shell/routemap.sh", "post",
                   request.data["seq"],
                   request.data["name"],
                   request.data["action"],
                   request.data["match_accesslist_num"],
                   request.data["match_accesslist_expanded"],
                   request.data["match_prefix_len"],
                   request.data["match_prefix_list"],
                   request.data["match_nexthop_accesslist_num"],
                   request.data["match_nexthop_accesslist_expanded"],
                   request.data["match_nexthop_prefix_len"],
                   request.data["match_nexthop_prefix_list"],
                   request.data["match_as_path"],
                   request.data["match_community_name"],
                   request.data["match_community_standard"],
                   request.data["match_community_expanded"],
                   request.data["match_metric"],
                   request.data["match_tag"],
                   request.data["match_local_preference"],
                   request.data["match_peer_ip"],
                   request.data["match_peer_interface"],
                   request.data["match_source_protocol"],
                   request.data["match_source_instance"],
                   request.data["match_origin"],
                   request.data["set_tag"],
                   request.data["set_ip_nexthop"],
                   request.data["set_nexthop_peer_addr_bgp"],
                   request.data["set_nexthop_unchanged"],
                   request.data["set_local_preference"],
                   request.data["set_local_preference_add"],
                   request.data["set_local_preference_sub"],
                   request.data["set_distance"],
                   request.data["set_as_path_bgp_exclude"],
                   request.data["set_as_path_bgp_prepend"],
                   request.data["set_community_name"],
                   request.data["set_metric"],
                   request.data["set_origin"],
                   request.data["set_aggregator_num"],
                   request.data["set_aggregator_ip"],
                   request.data["call"],
                   request.data["continue_seq"]]

        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)

        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class RouteMapDetail(APIView):
    """ Route Map Detail"""
    def get_obj(self, primary_key):
        """ GET Route Map Detail"""
        try:
            return models.RouteMap.objects.get(pk=primary_key)
        except models.RouteMap.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a route map instance"""
        route_map = self.get_obj(primary_key)
        serializer = serializers.RouteMapSerializer(route_map)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a route map instance"""
        route_map = self.get_obj(primary_key)
        serializer = serializers.RouteMapSerializer(
            instance=route_map,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)

        command = ["/bin/bash", "policyroutes/shell/routemap.sh", "put",
                   request.data["seq"],
                   request.data["name"],
                   request.data["action"],
                   request.data["match_accesslist_num"],
                   request.data["match_accesslist_expanded"],
                   request.data["match_prefix_len"],
                   request.data["match_prefix_list"],
                   request.data["match_nexthop_accesslist_num"],
                   request.data["match_nexthop_accesslist_expanded"],
                   request.data["match_nexthop_prefix_len"],
                   request.data["match_nexthop_prefix_list"],
                   request.data["match_as_path"],
                   request.data["match_community_name"],
                   request.data["match_community_standard"],
                   request.data["match_community_expanded"],
                   request.data["match_metric"],
                   request.data["match_tag"],
                   request.data["match_local_preference"],
                   request.data["match_peer_ip"],
                   request.data["match_peer_interface"],
                   request.data["match_source_protocol"],
                   request.data["match_source_instance"],
                   request.data["match_origin"],
                   request.data["set_tag"],
                   request.data["set_ip_nexthop"],
                   request.data["set_nexthop_peer_addr_bgp"],
                   request.data["set_nexthop_unchanged"],
                   request.data["set_local_preference"],
                   request.data["set_local_preference_add"],
                   request.data["set_local_preference_sub"],
                   request.data["set_distance"],
                   request.data["set_as_path_bgp_exclude"],
                   request.data["set_as_path_bgp_prepend"],
                   request.data["set_community_name"],
                   request.data["set_metric"],
                   request.data["set_origin"],
                   request.data["set_aggregator_num"],
                   request.data["set_aggregator_ip"],
                   request.data["call"],
                   request.data["continue_seq"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.RouteMapSerializer(route_map, data=request.data,partial=True)
        common_func.save_serializer_put(serializer)

        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a route map instance"""
        route_map = self.get_obj(primary_key)
        command = ["/bin/bash", "policyroutes/shell/routemap.sh", "delete",
                   request.data["name"]]
        common_func.insert_cmd_shell(command)
        route_map.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )

######################## End Route Map ###################
