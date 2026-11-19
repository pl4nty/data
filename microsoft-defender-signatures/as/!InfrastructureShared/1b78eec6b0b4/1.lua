-- Threat: !InfrastructureShared
-- Name: 1b78eec6b0b4
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
