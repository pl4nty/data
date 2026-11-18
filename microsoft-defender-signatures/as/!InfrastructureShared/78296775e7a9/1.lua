-- Threat: !InfrastructureShared
-- Name: 78296775e7a9
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
