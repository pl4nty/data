-- Threat: !InfrastructureShared
-- Name: 26783fd8bf0b
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
