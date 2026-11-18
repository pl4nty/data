-- Threat: !InfrastructureShared
-- Name: b829065356e5
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
