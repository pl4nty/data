-- Threat: !InfrastructureShared
-- Name: 267817b564fb
-- Type: 21

if mp.get_mpattribute("MpInternal_IsPliScan") then
  return mp.INFECTED
end
return mp.CLEAN
