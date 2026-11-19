-- Threat: !InfrastructureShared
-- Name: 1f299e08b61c
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
