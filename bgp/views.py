#from django.shortcuts import render
import os
from rest_framework import status
from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView

from bgp import models
from bgp import serializers

from lib import common_func
BASE_DIRECTORY = os.path.join(os.getcwd(), "../lib")




########################## start Basic BGP ########################

class BgpBasic(APIView):
    """ BGP Basic """

    def get(self, request):
        """List all BGP"""
        bgp = models.Bgp.objects.all()
        serializer = serializers.BgpSerializer(bgp, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new BGP"""
        serializer = serializers.BgpSerializer(
            data=request.data
        )
        common_func.check_serializer_is_valid(serializer)
        if request.data["neighbor_interface_name"] !="":
            ret=common_func.check_interface_validation(
               request.data["neighbor_interface_name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "bgp/shell/bgp_basic.sh", "post", request.data["as_number"],
                   request.data["router_id"], request.data["neighbor_addr"],
                   request.data["neighbor_interface_name"], request.data["remote_as_num"],
                   request.data["remote_as_internal"], request.data["remote_as_external"]]

        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)
        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )
class BgpBasicDetail(APIView):
    """ bgp basic Detail """
    def get_obj(self, primary_key):
        """ Get Details Bgp"""
        try:
            return models.Bgp.objects.get(pk=primary_key)
        except models.Bgp.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a BGP instance"""
        bgp = self.get_obj(primary_key)
        serializer = serializers.BgpSerializer(bgp)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a BGP instance"""
        bgp = self.get_obj(primary_key)
        serializer = serializers.BgpSerializer(
            instance=bgp,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["neighbor_interface_name"] !="":
            ret=common_func.check_interface_validation(
                request.data["neighbor_interface_name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "bgp/shell/bgp_basic.sh", "put", request.data["as_number"],
                   request.data["router_id"], request.data["neighbor_addr"],
                   request.data["neighbor_interface_name"], request.data["remote_as_num"],
                   request.data["remote_as_internal"],request.data["remote_as_external"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.BgpSerializer(bgp, data=request.data, partial=True)
        common_func.save_serializer_put(serializer)
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a BGP instance"""
        bgp = self.get_obj(primary_key)
        command = ["/bin/bash", "bgp/shell/bgp_basic.sh", "delete", request.data["as_number"]]
        common_func.insert_cmd_shell(command)
        bgp.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )


########################## End Basic BGP ########################

########################## Start Address Family ##################

class BgpAddrFamily(APIView):
    """ BGP Address Family """
    def get(self, request):
        """List all BGP Address Family"""
        bgp_addr_family = models.BgpAddrFamily.objects.all()
        serializer = serializers.BgpAddrFamilySerializer(bgp_addr_family, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new BGP Address Family"""
        serializer = serializers.BgpAddrFamilySerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["neighbor_interface_name"] !="":
            ret=common_func.check_interface_validation(
                request.data["neighbor_interface_name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "bgp/shell/bgp_addrfamily.sh", "post",
                   request.data["as_number"],
                   request.data["type_addr_family"],
                   request.data["aggregate_address"],
                   request.data["aggregate_address_prefix"],
                   request.data["aggregate_address_as_set"],
                   request.data["aggregate_address_routemap"],
                   request.data["aggregate_address_summery_only"],
                   request.data["distance_admin"],
                   request.data["distance_admin_ip"],
                   request.data["distance_admin_prefix"],
                   request.data["distance_external_routes"],
                   request.data["distance_internal_routes"],
                   request.data["distance_local_routes"],
                   request.data["maximum_paths"],
                   request.data["maximum_paths_ibgp"],
                   request.data["network_addr"],
                   request.data["network_addr_prefix"],
                   request.data["network_route_map"],
                   request.data["redistribute"],
                   request.data["neighbor_addr"],
                   request.data["neighbor_interface_name"],
                   request.data["neighbor_addpath_tx_all_paths"],
                   request.data["neighbor_addpath_tx_bestpath_per_as"],
                   request.data["neighbor_allowas_in"],
                   request.data["neighbor_allowas_in_origin"],
                   request.data["neighbor_as_override"],
                   request.data["neighbor_attribute_unchanged_all"],
                   request.data["neighbor_attribute_unchanged_as_path"],
                   request.data["neighbor_attribute_unchanged_med"],
                   request.data["neighbor_attribute_unchanged_nexthop"],
                   request.data["neighbor_default_originate"],
                   request.data["neighbor_default_originate_routemap"],
                   request.data["neighbor_distribute_list_num"],
                   request.data["neighbor_distribute_list_expanded"],
                   request.data["neighbor_distribute_list_in_out"],
                   request.data["neighbor_prefix_list"],
                   request.data["neighbor_prefix_list_in_out"],
                   request.data["neighbor_route_map"],
                   request.data["neighbor_route_map_in_out"],
                   request.data["neighbor_send_community"]]
        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)
        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class BgpAddrFamilyDetail(APIView):
    """ BGP Adress Family Details"""
    def get_obj(self, primary_key):
        "GET Detail  BGP Address Family"
        try:
            return models.BgpAddrFamily.objects.get(pk=primary_key)
        except models.BgpAddrFamily.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a BGP Address Family instance"""
        bgp_addr_family = self.get_obj(primary_key)
        serializer = serializers.BgpAddrFamilySerializer(bgp_addr_family)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a BGP Address Family instance"""
        bgp_addr_family = self.get_obj(primary_key)
        serializer = serializers.BgpAddrFamilySerializer(
            instance=bgp_addr_family,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["neighbor_interface_name"] !="":
            ret=common_func.check_interface_validation(
                request.data["neighbor_interface_name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "bgp/shell/bgp_addrfamily.sh", "put",
                   request.data["as_number"],
                   request.data["type_addr_family"],
                   request.data["aggregate_address"],
                   request.data["aggregate_address_prefix"],
                   request.data["aggregate_address_as_set"],
                   request.data["aggregate_address_routemap"],
                   request.data["aggregate_address_summery_only"],
                   request.data["distance_admin"],
                   request.data["distance_admin_ip"],
                   request.data["distance_admin_prefix"],
                   request.data["distance_external_routes"],
                   request.data["distance_internal_routes"],
                   request.data["distance_local_routes"],
                   request.data["maximum_paths"],
                   request.data["maximum_paths_ibgp"],
                   request.data["network_addr"],
                   request.data["network_addr_prefix"],
                   request.data["network_route_map"],
                   request.data["redistribute"],
                   request.data["neighbor_addr"],
                   request.data["neighbor_interface_name"],
                   request.data["neighbor_addpath_tx_all_paths"],
                   request.data["neighbor_addpath_tx_bestpath_per_as"],
                   request.data["neighbor_allowas_in"],
                   request.data["neighbor_allowas_in_origin"],
                   request.data["neighbor_as_override"],
                   request.data["neighbor_attribute_unchanged_all"],
                   request.data["neighbor_attribute_unchanged_as_path"],
                   request.data["neighbor_attribute_unchanged_med"],
                   request.data["neighbor_attribute_unchanged_nexthop"],
                   request.data["neighbor_default_originate"],
                   request.data["neighbor_default_originate_routemap"],
                   request.data["neighbor_distribute_list_num"],
                   request.data["neighbor_distribute_list_expanded"],
                   request.data["neighbor_distribute_list_in_out"],
                   request.data["neighbor_prefix_list"],
                   request.data["neighbor_prefix_list_in_out"],
                   request.data["neighbor_route_map"],
                   request.data["neighbor_route_map_in_out"],
                   request.data["neighbor_send_community"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.BgpAddrFamilySerializer(bgp_addr_family,
                                                          data=request.data, partial=True)
        common_func.save_serializer_put(serializer)
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a BGP Address Family instance"""
        bgp_addr_family = self.get_obj(primary_key)
        command = ["/bin/bash", "bgp/shell/bgp_addrfamily.sh", "delete",
                   request.data["as_number"], request.data["type_addr_family"],
                   request.data["aggregate_address"], request.data["aggregate_address_prefix"],
                   request.data["distance_admin"], request.data["distance_admin_ip"],
                   request.data["distance_admin_prefix"], request.data["network_addr"],
                   request.data["network_addr_prefix"],request.data["redistribute"],
                   request.data["neighbor_addr"],
                   request.data["neighbor_interface_name"]]
        common_func.insert_cmd_shell(command)
        bgp_addr_family.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )


########################## End Address Family ##################


########################## Start BGP Global ##############

class BgpGlobal(APIView):
    """BGP Global """
    def get(self, request):
        """List all BGP Global Parameters"""
        bgp_global = models.BgpGlobal.objects.all()
        serializer = serializers.BgpGlobalSerializer(bgp_global, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new BGP Global Parameters"""
        serializer = serializers.BgpGlobalSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["neighbor_interface_name"] !="":
            ret=common_func.check_interface_validation(
                request.data["neighbor_interface_name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "bgp/shell/bgp_global.sh", "post",
                   request.data["as_number"],
                   request.data["neighbor_addr"],
                   request.data["neighbor_interface_name"],
                   request.data["neighbor_update_source_addr"],
                   request.data["neighbor_update_source_interface_name"],
                   request.data["neighbor_ebgp_multihop"],
                   request.data["neighbor_ebgp_multihop_numhop"],
                   request.data["neighbor_shutdown"],
                   request.data["neighbor_keepalive"],
                   request.data["neighbor_holdtime"],
                   request.data["neighbor_connect_timer"],
                   request.data["neighbor_password"],
                   request.data["neighbor_passive"],
                   request.data["neighbor_ttl_security"],
                   request.data["timer_keepalive"],
                   request.data["timer_holdtime"],
                   request.data["update_delay"]]
        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)
        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class BgpGlobalDetail(APIView):
    """ BGP Global Detail """
    def get_obj(self, primary_key):
        """ GET BGP Global Detail"""
        try:
            return models.BgpGlobal.objects.get(pk=primary_key)
        except models.BgpGlobal.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a BGP Global Parameters instance"""
        bgp_global = self.get_obj(primary_key)
        serializer = serializers.BgpGlobalSerializer(bgp_global)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a BGP Global Parameters instance"""
        bgp_global = self.get_obj(primary_key)
        serializer = serializers.BgpGlobalSerializer(
            instance=bgp_global,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["neighbor_interface_name"] !="":
            ret=common_func.check_interface_validation(
                request.data["neighbor_interface_name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "bgp/shell/bgp_global.sh", "post",
                   request.data["as_number"],
                   request.data["neighbor_addr"],
                   request.data["neighbor_interface_name"],
                   request.data["neighbor_update_source_addr"],
                   request.data["neighbor_update_source_interface_name"],
                   request.data["neighbor_ebgp_multihop"],
                   request.data["neighbor_ebgp_multihop_numhop"],
                   request.data["neighbor_shutdown"],
                   request.data["neighbor_keepalive"],
                   request.data["neighbor_holdtime"],
                   request.data["neighbor_connect_timer"],
                   request.data["neighbor_password"],
                   request.data["neighbor_passive"],
                   request.data["neighbor_ttl_security"],
                   request.data["timer_keepalive"],
                   request.data["timer_holdtime"],
                   request.data["update_delay"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.BgpGlobalSerializer(bgp_global, data=request.data,partial=True)
        common_func.save_serializer_put(serializer)
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)


    def delete(self, request, primary_key):
        """Delete a BGP Global Parameters instance"""
        bgp_global = self.get_obj(primary_key)
        command = ["/bin/bash", "bgp/shell/bgp_global.sh", "delete",
                   request.data["as_number"],
                   request.data["neighbor_addr"],
                   request.data["neighbor_interface_name"],
                   request.data["neighbor_ttl_security"]]
        common_func.insert_cmd_shell(command)
        bgp_global.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )

########################## End Advanced Global ################
