-- Threat: !InfrastructureShared
-- Name: 1f7894cbbd56
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
