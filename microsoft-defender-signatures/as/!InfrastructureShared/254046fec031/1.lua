-- Threat: !InfrastructureShared
-- Name: 254046fec031
-- Type: 21

pe.set_peattribute("enable_vmm_grow", true)
pe.reemulate()
return mp.INFECTED
