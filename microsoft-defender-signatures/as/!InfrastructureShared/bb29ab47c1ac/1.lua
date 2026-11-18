-- Threat: !InfrastructureShared
-- Name: bb29ab47c1ac
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
