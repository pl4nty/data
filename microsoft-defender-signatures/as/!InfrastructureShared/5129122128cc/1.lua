-- Threat: !InfrastructureShared
-- Name: 5129122128cc
-- Type: 21

if mp.get_mpattribute("Nscript:Type_ps") or mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") or mp.get_mpattribute("PACKED_WITH:[CMDInlineScript]") then
  return mp.INFECTED
end
return mp.CLEAN
