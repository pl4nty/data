-- Threat: !InfrastructureShared
-- Name: d229dc4de31d
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
