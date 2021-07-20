from subprocess import Popen, PIPE, STDOUT, TimeoutExpired
from rest_framework import status
from rest_framework.response import Response
from pyroute2 import IPRoute

SUCCESS = 1
NOT_SUCCESS = 0

def insert_cmd_shell(command):
    """insert params into frr by shell"""
    proc = Popen(command, stdout=PIPE, stderr=STDOUT)
    try:
        _outs, _errs = proc.communicate(timeout=30)
        exit_status = proc.poll()
        if exit_status != 0:
            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    except TimeoutExpired:
        proc.kill()
        _outs, _errs = proc.communicate()
        return Response(status=status.HTTP_408_REQUEST_TIMEOUT)
    return SUCCESS


def check_serializer_is_valid(serializer):
    """check serializer is valid """
    if not serializer.is_valid():
        return Response(
            data=serializer.errors,
            status=status.HTTP_400_BAD_REQUEST
        )
    return SUCCESS


def save_serializer_post(serializer):
    """ save serializers in post methods"""
    serializer.save()
    return SUCCESS


def save_serializer_put(serializer):
    """save serializers in put methods"""
    if serializer.is_valid():
        serializer.save()
    return SUCCESS


def check_interface_validation(interface):
    """check interface name"""
    ipr = IPRoute()
    try:
        ipr.link_lookup(ifname=interface)[0]
    except IndexError:
        ipr.close()
        return 0
    return SUCCESS
