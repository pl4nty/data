-- Threat: !InfrastructureShared
-- Name: 1e78cf35b163
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
