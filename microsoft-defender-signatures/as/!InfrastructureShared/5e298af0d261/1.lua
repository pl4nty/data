-- Threat: !InfrastructureShared
-- Name: 5e298af0d261
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
