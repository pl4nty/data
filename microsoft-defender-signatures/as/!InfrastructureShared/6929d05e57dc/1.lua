-- Threat: !InfrastructureShared
-- Name: 6929d05e57dc
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
