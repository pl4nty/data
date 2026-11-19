-- Threat: !InfrastructureShared
-- Name: 6d294ae8ff4a
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
