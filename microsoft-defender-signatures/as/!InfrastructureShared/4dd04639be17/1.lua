-- Threat: !InfrastructureShared
-- Name: 4dd04639be17
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.CLEAN
end
return mp.INFECTED
