-- Threat: !InfrastructureShared
-- Name: 8d298bd188ee
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
