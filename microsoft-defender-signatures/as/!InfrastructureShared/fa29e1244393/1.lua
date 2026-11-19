-- Threat: !InfrastructureShared
-- Name: fa29e1244393
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
