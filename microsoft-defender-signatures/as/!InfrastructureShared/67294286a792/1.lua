-- Threat: !InfrastructureShared
-- Name: 67294286a792
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
