-- Threat: !InfrastructureShared
-- Name: 3c785de736d6
-- Type: 21

if mp.get_mpattribute("MpAPILimitReached") then
  pe.set_peattribute("deep_analysis", true)
  pe.set_peattribute("disable_apicall_limit", true)
  pe.reemulate()
end
return mp.LOWFI
