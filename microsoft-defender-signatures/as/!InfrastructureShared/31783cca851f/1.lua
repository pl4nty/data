-- Threat: !InfrastructureShared
-- Name: 31783cca851f
-- Type: 21

mp.set_mpattribute("do_exhaustivehstr_rescan")
pe.set_peattribute("deep_analysis", true)
pe.reemulate()
return mp.INFECTED
