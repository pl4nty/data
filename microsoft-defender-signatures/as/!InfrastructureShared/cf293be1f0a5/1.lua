-- Threat: !InfrastructureShared
-- Name: cf293be1f0a5
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
