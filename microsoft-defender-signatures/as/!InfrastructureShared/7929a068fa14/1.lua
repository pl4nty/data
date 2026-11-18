-- Threat: !InfrastructureShared
-- Name: 7929a068fa14
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
