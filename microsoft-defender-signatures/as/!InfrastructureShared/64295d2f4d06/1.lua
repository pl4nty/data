-- Threat: !InfrastructureShared
-- Name: 64295d2f4d06
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
