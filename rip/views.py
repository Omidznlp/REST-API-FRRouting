import os
from rest_framework import status
from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView


from rip import models
from rip import serializers

from lib import common_func
BASE_DIRECTORY = os.path.join(os.getcwd(), "../lib")




########################## Start Basic RIP ########################
class RipBasic(APIView):
    """ Rip Basic"""
    def get(self, request):
        """List all rip"""
        rip = models.Rip.objects.all()
        serializer = serializers.RipSerializer(rip, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new rip"""
        serializer = serializers.RipSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["network_interface_name"] !="":
            ret=common_func.check_interface_validation(
                request.data["network_interface_name"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "rip/shell/rip_basic.sh", "post", request.data["network_addr"],
                   request.data["network_prefix"],
                   request.data["network_interface_name"], request.data["version"]]

        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)

        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class RipBasicDetail(APIView):
    """ Rip Basic Detail"""
    def get_obj(self, primary_key):
        """GET Rip Basic Detail"""
        try:
            return models.Rip.objects.get(pk=primary_key)
        except models.Rip.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a rip instance"""
        rip = self.get_obj(primary_key)
        serializer = serializers.RipSerializer(rip)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a rip instance"""
        rip = self.get_obj(primary_key)
        serializer = serializers.RipSerializer(
            instance=rip,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)

        command = ["/bin/bash", "rip/shell/rip_basic.sh", "put",request.data["version"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.RipSerializer(rip, data=request.data, partial=True)
        common_func.save_serializer_put(serializer)

        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a rip instance"""
        rip = self.get_obj(primary_key)
        command = ["/bin/bash", "rip/shell/rip_basic.sh", "delete"]
        common_func.insert_cmd_shell(command)
        rip.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )


########################## END Basic RIP ########################

########################## Start Advanced RIP ##################
class RipAdvanced(APIView):
    """ Rip Advanced"""
    def get(self, request):
        """List all rip"""
        rip_adv = models.RipAdvanced.objects.all()
        serializer = serializers.RipAdvancedSerializer(rip_adv, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new rip"""
        serializer = serializers.RipAdvancedSerializer(
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
        command = ["/bin/bash", "rip/shell/rip_advanced.sh", "post",
                   request.data["neighbor"],request.data["passive_interface"],
                   request.data["allow_ecmp"], request.data["default_info_originate"],
                   request.data["redistribute"],
                   request.data["default_metric"], request.data["distance"],
                   request.data["distribute_list_perfix_in_out"],
                   request.data["timers_update_time"],request.data["timers_time_out"],
                   request.data["timers_garbage_time"], request.data["interface_name"],
                   request.data["interface_auth_key_chain"],
                   request.data["interface_auth_string"],request.data["interface_auth_mode_md5"],
                   request.data["interface_auth_mode_text"],
                   request.data["interface_receive_version"],request.data["interface_send_version"]]

        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)

        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class RipAdvancedDetail(APIView):
    """ Rip advanced Detail"""
    def get_obj(self, primary_key):
        """ GET Rip advanced Detail"""
        try:
            return models.RipAdvanced.objects.get(pk=primary_key)
        except models.RipAdvanced.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a rip instance"""
        rip_adv = self.get_obj(primary_key)
        serializer = serializers.RipAdvancedSerializer(rip_adv)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a rip instance"""
        rip_adv = self.get_obj(primary_key)
        serializer = serializers.RipAdvancedSerializer(
            instance=rip_adv,
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
        command = ["/bin/bash", "rip/shell/rip_advanced.sh", "put",
                   request.data["allow_ecmp"], request.data["default_info_originate"],
                   request.data["default_metric"], request.data["distance"],
                   request.data["timers_update_time"], request.data["timers_time_out"],
                   request.data["timers_garbage_time"], request.data["interface_name"],
                   request.data["interface_auth_key_chain"],
                   request.data["interface_auth_string"],request.data["interface_auth_mode_md5"],
                   request.data["interface_auth_mode_text"],
                   request.data["interface_receive_version"],request.data["interface_send_version"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.RipAdvancedSerializer(rip_adv, data=request.data,partial=True)
        common_func.save_serializer_put(serializer)
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a rip instance"""
        rip_adv = self.get_obj(primary_key)
        command = ["/bin/bash", "rip/shell/rip_advanced.sh", "delete",request.data["neighbor"],
                   request.data["passive_interface"],request.data["distribute_list_perfix_in_out"],
                   request.data["redistribute"],request.data["interface_name"]]
        common_func.insert_cmd_shell(command)
        rip_adv.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )


########################## End Advanced RIP ##################
