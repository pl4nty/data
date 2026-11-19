-- Threat: !InfrastructureShared
-- Name: 542902e30c1e
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
