-- Threat: !InfrastructureShared
-- Name: 1b95742d83f8
-- Type: 21

pe.set_peattribute("enable_vmm_grow", true)
pe.reemulate()
return mp.INFECTED
