-- Threat: !InfrastructureShared
-- Name: 1a4293dc05a74
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
