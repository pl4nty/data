-- Threat: !InfrastructureShared
-- Name: 4629d417714f
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
