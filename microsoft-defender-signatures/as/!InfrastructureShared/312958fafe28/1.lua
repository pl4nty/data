-- Threat: !InfrastructureShared
-- Name: 312958fafe28
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
