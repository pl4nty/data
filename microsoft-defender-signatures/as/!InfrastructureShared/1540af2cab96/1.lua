-- Threat: !InfrastructureShared
-- Name: 1540af2cab96
-- Type: 21

pe.set_peattribute("enable_vmm_grow", true)
pe.reemulate()
return mp.INFECTED
