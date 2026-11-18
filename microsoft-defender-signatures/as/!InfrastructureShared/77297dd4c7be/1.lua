-- Threat: !InfrastructureShared
-- Name: 77297dd4c7be
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
