-- Threat: !InfrastructureShared
-- Name: 7878182216f1
-- Type: 21

mp.set_mpattribute("do_deep_rescan")
pe.set_peattribute("disable_apicall_limit", true)
return mp.INFECTED
