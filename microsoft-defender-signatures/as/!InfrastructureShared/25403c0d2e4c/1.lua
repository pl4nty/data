-- Threat: !InfrastructureShared
-- Name: 25403c0d2e4c
-- Type: 21

pe.set_peattribute("hstr_exhaustive", true)
pe.set_peattribute("enable_vmm_grow", true)
pe.set_peattribute("deep_analysis", true)
pe.set_peattribute("disable_seh_limit", true)
pe.set_peattribute("disable_apicall_limit", true)
pe.reemulate()
return mp.INFECTED
