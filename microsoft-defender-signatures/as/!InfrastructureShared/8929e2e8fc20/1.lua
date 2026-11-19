-- Threat: !InfrastructureShared
-- Name: 8929e2e8fc20
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
