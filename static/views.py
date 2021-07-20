import os
from rest_framework import status
from rest_framework.exceptions import NotFound
from rest_framework.response import Response
from rest_framework.views import APIView


from static import models
from static import serializers

from lib import common_func
BASE_DIRECTORY = os.path.join(os.getcwd(), "../lib")




########################## Start Basic Static ########################
class StaticBasic(APIView):
    """ Static Basic """
    def get(self, request):
        """List all static"""
        static = models.Static.objects.all()
        serializer = serializers.StaticSerializer(static, many=True)
        return Response(
            data=serializer.data
        )

    def post(self, request):
        """Create a new static"""
        serializer = serializers.StaticSerializer(
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["interface_gateway"] !="":
            ret=common_func.check_interface_validation(
                request.data["interface_gateway"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "static/shell/static_basic.sh", "post", request.data["ip_dst"],
                   request.data["ip_dst_prefix"],
                   request.data["gateway"], request.data["interface_gateway"],
                   request.data["null_interface"],
                   request.data["distance"], request.data["reject"]]

        common_func.insert_cmd_shell(command)
        common_func.save_serializer_post(serializer)
        return Response(
            data=serializer.data,
            status=status.HTTP_201_CREATED
        )


class StaticBasicDetail(APIView):
    """ static Basic Detail"""
    def get_obj(self, primary_key):
        """ GET Basic Detail"""
        try:
            return models.Static.objects.get(pk=primary_key)
        except models.Static.DoesNotExist as exc:
            raise NotFound from exc

    def get(self, request, primary_key):
        """Get a static instance"""
        static = self.get_obj(primary_key)
        serializer = serializers.StaticSerializer(static)
        return Response(data=serializer.data)

    def put(self, request, primary_key):
        """Edit a static instance"""
        static = self.get_obj(primary_key)
        serializer = serializers.StaticSerializer(
            instance=static,
            data=request.data
        )

        common_func.check_serializer_is_valid(serializer)
        if request.data["interface_gateway"] !="":
            ret=common_func.check_interface_validation(
                request.data["interface_gateway"])
            if ret==0:
                return Response(
                    status=status.HTTP_406_NOT_ACCEPTABLE
                )
        command = ["/bin/bash", "static/shell/static_basic.sh", "put", request.data["ip_dst"],
                   request.data["ip_dst_prefix"],
                   request.data["gateway"], request.data["interface_gateway"],
                   request.data["null_interface"],
                   request.data["distance"], request.data["reject"]]

        common_func.insert_cmd_shell(command)
        serializer = serializers.StaticSerializer(static, data=request.data,partial=True)
        common_func.save_serializer_put(serializer)

        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, primary_key):
        """Delete a static instance"""
        static = self.get_obj(primary_key)
        command = ["/bin/bash", "static/shell/static_basic.sh", "delete", request.data["ip_dst"],
                   request.data["ip_dst_prefix"], request.data["gateway"],
                   request.data["interface_gateway"],
                   request.data["null_interface"], request.data["reject"]]

        common_func.insert_cmd_shell(command)
        static.delete()
        return Response(
            status=status.HTTP_204_NO_CONTENT
        )

########################## END Basic Static ########################
