-- Threat: !InfrastructureShared
-- Name: 6a291b2b0f02
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
