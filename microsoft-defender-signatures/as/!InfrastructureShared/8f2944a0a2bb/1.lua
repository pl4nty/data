-- Threat: !InfrastructureShared
-- Name: 8f2944a0a2bb
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
