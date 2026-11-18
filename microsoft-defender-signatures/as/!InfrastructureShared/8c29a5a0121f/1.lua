-- Threat: !InfrastructureShared
-- Name: 8c29a5a0121f
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
