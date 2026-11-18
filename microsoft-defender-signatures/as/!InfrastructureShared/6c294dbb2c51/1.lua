-- Threat: !InfrastructureShared
-- Name: 6c294dbb2c51
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
