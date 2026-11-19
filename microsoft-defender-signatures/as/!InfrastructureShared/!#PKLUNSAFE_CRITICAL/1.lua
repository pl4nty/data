-- Threat: !InfrastructureShared
-- Name: !#//PKL:UNSAFE_CRITICAL
-- Type: 13
-- MpAttributes: MpIsPKLGlobalScan

if #mp.enum_mpattributesubstring("PKL_CRIT:") >= 1 then
  return mp.INFECTED
end
return mp.CLEAN
