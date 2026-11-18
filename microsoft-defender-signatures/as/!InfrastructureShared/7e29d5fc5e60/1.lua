-- Threat: !InfrastructureShared
-- Name: 7e29d5fc5e60
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
