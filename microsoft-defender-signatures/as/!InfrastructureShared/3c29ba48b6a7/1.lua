-- Threat: !InfrastructureShared
-- Name: 3c29ba48b6a7
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
