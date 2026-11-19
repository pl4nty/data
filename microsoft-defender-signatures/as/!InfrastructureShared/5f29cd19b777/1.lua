-- Threat: !InfrastructureShared
-- Name: 5f29cd19b777
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
