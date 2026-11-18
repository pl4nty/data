-- Threat: !InfrastructureShared
-- Name: 272975ab73e0
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
