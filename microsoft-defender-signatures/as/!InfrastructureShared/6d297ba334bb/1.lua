-- Threat: !InfrastructureShared
-- Name: 6d297ba334bb
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
