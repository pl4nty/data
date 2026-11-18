-- Threat: !InfrastructureShared
-- Name: 6529d84573b3
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
