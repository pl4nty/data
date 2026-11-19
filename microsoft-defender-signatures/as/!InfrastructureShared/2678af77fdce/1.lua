-- Threat: !InfrastructureShared
-- Name: 2678af77fdce
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
