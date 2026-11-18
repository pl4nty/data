-- Threat: !InfrastructureShared
-- Name: 2678bc993069
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
