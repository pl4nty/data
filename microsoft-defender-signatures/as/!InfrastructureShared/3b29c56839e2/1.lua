-- Threat: !InfrastructureShared
-- Name: 3b29c56839e2
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
