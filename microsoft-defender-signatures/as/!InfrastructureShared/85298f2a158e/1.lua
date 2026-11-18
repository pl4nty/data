-- Threat: !InfrastructureShared
-- Name: 85298f2a158e
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
