import os
from rest_framework import status
from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView
from ospf import models
from ospf import serializers

from lib import common_func
BASE_DIRECTORY = os.path.join(os.getcwd(), "../lib")




########################## start Basic OSPF ########################
class OspfBasic(APIView):
    """ OSPF Basic """
    def get(self, request):
        """List all ospf"""
        ospf = models.Ospf.objects.all()
        serializer = serializers.OspfSerializer(ospf, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """ Create a new ospf """
        serializer = serializers.OspfSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["interface_name"] !="":
            ret=common_func.check_interface_validation(
                request.data["interface_name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "ospf/shell/ospf_basic.sh", "post",
                   request.data["id_instance"],
                   request.data["router_id"],
                   request.data["interface_name"],
                   request.data["interface_area"]]

        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)

        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class OspfBasicDetail(APIView):
    """ OSPF Basic Detail """
    def get_obj(self, primary_key):
        """ GET OSPF Basic Detail """
        try:
            return models.Ospf.objects.get(pk=primary_key)
        except models.Ospf.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a ospf instance"""
        ospf = self.get_obj(primary_key)
        serializer = serializers.OspfSerializer(ospf)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a ospf instance"""
        ospf = self.get_obj(primary_key)
        serializer = serializers.OspfSerializer(
            instance=ospf,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["interface_name"] !="":
            ret=common_func.check_interface_validation(
                request.data["interface_name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "ospf/shell/ospf_basic.sh", "put",
                   request.data["id_instance"],
                   request.data["router_id"],
                   request.data["interface_name"],
                   request.data["interface_area"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.OspfSerializer(ospf, data=request.data, partial=True)
        common_func.save_serializer_put(serializer)
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a ospf instance"""
        ospf = self.get_obj(primary_key)
        command = ["/bin/bash", "ospf/shell/ospf_basic.sh", "delete", str(primary_key)]
        common_func.insert_cmd_shell(command)
        ospf.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )


########################## end Basic OSPF ########################

########################## start  Advanced Interface ##################
class OspfAdvInterface(APIView):
    """OSPF Adv Interface"""
    def get(self, request):
        """List all ospf"""
        ospfinterface = models.OspfAdvInterface.objects.all()
        serializer = serializers.OspfAdvInterfaceSerializer(ospfinterface, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new ospf"""
        serializer = serializers.OspfAdvInterfaceSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["name"] !="":
            ret=common_func.check_interface_validation(
                request.data["name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "ospf/shell/ospf_adv_int.sh", "post",
                   request.data["id_instance"],
                   request.data["name"],
                   request.data["hello_interval"],
                   request.data["retransmit_interval"],
                   request.data["transmit_delay"],
                   request.data["dead_interval"],
                   request.data["cost"],
                   request.data["priority"],
                   request.data["network_type"],
                   request.data["auth_message_digest"],
                   request.data["auth_key"],
                   request.data["message_digest_key"],
                   request.data["md5_key"]
                   ]
        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)
        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class OspfAdvInterfaceDetail(APIView):
    """ Ospf Adv Interface Detail """
    def get_obj(self, primary_key):
        """ Get OSPF Adv Interface Detail"""
        try:
            return models.OspfAdvInterface.objects.get(pk=primary_key)
        except models.OspfAdvInterface.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a ospf instance"""
        ospfinterface = self.get_obj(primary_key)
        serializer = serializers.OspfAdvInterfaceSerializer(ospfinterface)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a ospf instance"""
        ospfinterface = self.get_obj(primary_key)
        serializer = serializers.OspfAdvInterfaceSerializer(
            instance=ospfinterface,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["name"] !="":
            ret=common_func.check_interface_validation(
                request.data["name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "ospf/shell/ospf_adv_int.sh", "put",
                   request.data["id_instance"],
                   request.data["name"],
                   request.data["hello_interval"],
                   request.data["retransmit_interval"],
                   request.data["transmit_delay"],
                   request.data["dead_interval"],
                   request.data["cost"],
                   request.data["priority"],
                   request.data["network_type"],
                   request.data["auth_message_digest"],
                   request.data["auth_key"],
                   request.data["message_digest_key"],
                   request.data["md5_key"]
                   ]
        common_func.insert_cmd_shell(command)
        serializer = serializers.OspfAdvInterfaceSerializer(ospfinterface,
                                                            data=request.data,partial=True)
        common_func.save_serializer_put(serializer)
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a ospf instance"""
        ospfinterface = self.get_obj(primary_key)
        command = ["/bin/bash", "ospf/shell/ospf_adv_int.sh", "delete",
                   request.data["name"],
                   request.data["message_digest_key"]]
        common_func.insert_cmd_shell(command)
        ospfinterface.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )


########################## End  Advanced Interface ##################

########################## start Advanced Area ##################
class OspfAdvArea(APIView):
    """ Ospf adv Area"""
    def get(self, request):
        """List all ospf"""
        ospfarea = models.OspfAdvArea.objects.all()
        serializer = serializers.OspfAdvAreaSerializer(ospfarea, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new ospf"""
        serializer = serializers.OspfAdvAreaSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)

        command = ["/bin/bash", "ospf/shell/ospf_adv_area.sh", "post",
                   request.data["id_instance"],
                   request.data["interface_area"],
                   request.data["nssa"],
                   request.data["stub"],
                   request.data["stub_no_summery"],
                   request.data["default_cost"],
                   request.data["auth"],
                   request.data["auth_message_digest"],
                   request.data["virtual_link"]]

        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)
        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class OspfAdvAreaDetail(APIView):
    """ Ospf adv Area Detail"""
    def get_obj(self, primary_key):
        """Get Ospf adv Area Detail"""
        try:
            return models.OspfAdvArea.objects.get(pk=primary_key)
        except models.OspfAdvArea.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a ospf instance"""
        ospfarea = self.get_obj(primary_key)
        serializer = serializers.OspfAdvAreaSerializer(ospfarea)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a ospf instance"""
        ospfinterface = self.get_obj(primary_key)
        serializer = serializers.OspfAdvAreaSerializer(
            instance=ospfinterface,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)

        command = ["/bin/bash", "ospf/shell/ospf_adv_area.sh", "put",
                   request.data["id_instance"],
                   request.data["interface_area"],
                   request.data["nssa"],
                   request.data["stub"],
                   request.data["stub_no_summery"],
                   request.data["default_cost"],
                   request.data["auth"],
                   request.data["auth_message_digest"],
                   request.data["virtual_link"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.OspfAdvAreaSerializer(ospfinterface,
                                                       data=request.data, partial=True)
        common_func.save_serializer_put(serializer)
        if serializer.is_valid():
            serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a ospf instance"""
        ospfarea = self.get_obj(primary_key)
        command = ["/bin/bash", "ospf/shell/ospf_adv_area.sh", "delete",
                   request.data["id_instance"],
                   request.data["interface_area"],
                   request.data["default_cost"],
                   request.data["virtual_link"]]
        common_func.insert_cmd_shell(command)
        ospfarea.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )


########################## End Advanced Area ##################

########################## Start Advanced Global ##############
class OspfAdvGlobal(APIView):
    """ Ospf Adv Global"""
    def get(self, request):
        """List all ospf"""
        ospfglobal = models.OspfAdvGlobal.objects.all()
        serializer = serializers.OspfAdvGlobalSerializer(ospfglobal, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new ospf"""
        serializer = serializers.OspfAdvGlobalSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["passive_interface"] !="":
            ret=common_func.check_interface_validation(
                request.data["passive_interface"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "ospf/shell/ospf_adv_global.sh", "post",
                   request.data["id_instance"],
                   request.data["passive_interface"],
                   request.data["redistribute"],
                   request.data["default_metric"],
                   request.data["timers_lsa_min_interval"],
                   request.data["timers_throttle_lsa_all"],
                   request.data["timers_throttle_spf_delay"],
                   request.data["timers_throttle_initial_hold_time"],
                   request.data["timers_throttle_max_hold_time"],
                   request.data["ospf_abr_type"],
                   request.data["max_mertic_router_lsa_on_startup"],
                   request.data["max_mertic_router_lsa_on_shutdown"],
                   request.data["max_mertic_router_lsa_administrative"],
                   request.data["neighbor"],
                   request.data["neighbor_poll_interval"],
                   request.data["neighbor_poll_interval_priority"],
                   request.data["ospf_rfc1583compatibility"],
                   request.data["auto_cost_reference_bandwidth"],
                   request.data["distance"],
                   request.data["distance_ospf_inter_area"],
                   request.data["distance_ospf_intra_area"],
                   request.data["distance_ospf_external_area"],
                   request.data["default_info_originate"],
                   request.data["default_info_originate_always"],
                   request.data["default_info_metric"],
                   request.data["default_info_metric_type"],
                   request.data["default_info_route_map"],
                   request.data["log_adjacency_changes"]]

        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)

        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class OspfAdvGlobalDetail(APIView):
    """Ospf Adv Global Detail"""
    def get_obj(self, primary_key):
        """GET Adv Global Detail"""
        try:
            return models.OspfAdvGlobal.objects.get(pk=primary_key)
        except models.OspfAdvGlobal.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a ospf instance"""
        ospfglobal = self.get_obj(primary_key)
        serializer = serializers.OspfAdvGlobalSerializer(ospfglobal)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a ospf instance"""
        ospfglobal = self.get_obj(primary_key)
        serializer = serializers.OspfAdvGlobalSerializer(
            instance=ospfglobal,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["passive_interface"] !="":
            ret=common_func.check_interface_validation(
                request.data["passive_interface"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "ospf/shell/ospf_adv_global.sh", "post",
                   request.data["id_instance"],
                   request.data["passive_interface"],
                   request.data["redistribute"],
                   request.data["default_metric"],
                   request.data["timers_lsa_min_interval"],
                   request.data["timers_throttle_lsa_all"],
                   request.data["timers_throttle_spf_delay"],
                   request.data["timers_throttle_initial_hold_time"],
                   request.data["timers_throttle_max_hold_time"],
                   request.data["ospf_abr_type"],
                   request.data["max_mertic_router_lsa_on_startup"],
                   request.data["max_mertic_router_lsa_on_shutdown"],
                   request.data["max_mertic_router_lsa_administrative"],
                   request.data["neighbor"],
                   request.data["neighbor_poll_interval"],
                   request.data["neighbor_poll_interval_priority"],
                   request.data["ospf_rfc1583compatibility"],
                   request.data["auto_cost_reference_bandwidth"],
                   request.data["distance"],
                   request.data["distance_ospf_inter_area"],
                   request.data["distance_ospf_intra_area"],
                   request.data["distance_ospf_external_area"],
                   request.data["default_info_originate"],
                   request.data["default_info_originate_always"],
                   request.data["default_info_metric"],
                   request.data["default_info_metric_type"],
                   request.data["default_info_route_map"],
                   request.data["log_adjacency_changes"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.OspfAdvGlobalSerializer(ospfglobal, data=request.data,partial=True)
        common_func.save_serializer_put(serializer)

        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a ospf instance"""
        ospfglobal = self.get_obj(primary_key)
        command = ["/bin/bash", "ospf/shell/ospf_adv_global.sh", "delete",
                   request.data["id_instance"],
                   request.data["passive_interface"],
                   request.data["redistribute"],
                   request.data["ospf_abr_type"],
                   request.data["neighbor"],
                   request.data["distance"],
                   request.data["default_info_metric"],
                   request.data["default_info_metric_type"],
                   request.data["default_info_route_map"]]

        common_func.insert_cmd_shell(command)
        ospfglobal.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )
########################## End Advanced Global ################
