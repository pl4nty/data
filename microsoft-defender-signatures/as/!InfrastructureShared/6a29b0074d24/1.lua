-- Threat: !InfrastructureShared
-- Name: 6a29b0074d24
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
