-- Threat: !InfrastructureShared
-- Name: 3b898e54c86e
-- Type: 21

pe.set_peattribute("hstr_exhaustive", true)
pe.set_peattribute("enable_vmm_grow", true)
pe.set_peattribute("deep_analysis", true)
pe.set_peattribute("disable_seh_limit", true)
pe.set_peattribute("disable_apicall_limit", true)
return mp.LOWFI
