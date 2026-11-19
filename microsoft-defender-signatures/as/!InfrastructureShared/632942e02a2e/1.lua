-- Threat: !InfrastructureShared
-- Name: 632942e02a2e
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
