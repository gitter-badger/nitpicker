# -*- coding: utf-8 -*-
from .cvs_adapter import CVSAdapter


class NullAdapter(CVSAdapter):
    """
    Null implementation of CVSAdapter
    """

    def get_user_name(self):
        return "Unknown"

    def get_user_email(self):

        return "Unknown"