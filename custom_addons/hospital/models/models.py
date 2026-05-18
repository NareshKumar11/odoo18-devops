# -*- coding: utf-8 -*-

from odoo import models, fields, api


class hospital(models.Model):
    _name = 'hospital.hospital'
    _description = 'hospital.hospital'

    name = fields.Char()
    value = fields.Integer()
    value2 = fields.Float()
    description = fields.Text()


