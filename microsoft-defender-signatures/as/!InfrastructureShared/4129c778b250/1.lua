-- Threat: !InfrastructureShared
-- Name: 4129c778b250
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
