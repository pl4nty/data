-- Threat: !InfrastructureShared
-- Name: 4729dcd7c903
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
