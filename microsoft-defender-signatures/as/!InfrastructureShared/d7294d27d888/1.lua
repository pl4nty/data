-- Threat: !InfrastructureShared
-- Name: d7294d27d888
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
