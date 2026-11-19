-- Threat: !InfrastructureShared
-- Name: 8e299eda572e
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
