-- Threat: !InfrastructureShared
-- Name: 34782e2e017d
-- Type: 21

if mp.get_mpattribute("MpAPILimitReached") then
  pe.set_peattribute("deep_analysis", true)
  pe.set_peattribute("disable_apicall_limit", true)
  pe.reemulate()
  return mp.INFECTED
end
return mp.CLEAN
