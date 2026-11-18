-- Threat: !InfrastructureShared
-- Name: c4292b4f0a6c
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
