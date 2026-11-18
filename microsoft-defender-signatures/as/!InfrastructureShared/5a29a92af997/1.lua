-- Threat: !InfrastructureShared
-- Name: 5a29a92af997
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
