-- Threat: !InfrastructureShared
-- Name: !#//PKL:UNSAFE_HIGH
-- Type: 13
-- MpAttributes: MpIsPKLGlobalScan

if #mp.enum_mpattributesubstring("PKL_HIGH:") >= 1 then
  return mp.INFECTED
end
return mp.CLEAN
