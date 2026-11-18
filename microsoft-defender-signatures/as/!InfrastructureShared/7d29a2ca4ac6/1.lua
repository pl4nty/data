-- Threat: !InfrastructureShared
-- Name: 7d29a2ca4ac6
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
