-- Threat: !InfrastructureShared
-- Name: ce29f532f80b
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
