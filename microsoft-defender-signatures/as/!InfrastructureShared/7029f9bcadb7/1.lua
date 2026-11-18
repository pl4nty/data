-- Threat: !InfrastructureShared
-- Name: 7029f9bcadb7
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
