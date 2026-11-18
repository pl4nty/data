-- Threat: !InfrastructureShared
-- Name: 1602966880849
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
