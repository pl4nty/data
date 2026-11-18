-- Threat: !InfrastructureShared
-- Name: 7a29a58c0d42
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
