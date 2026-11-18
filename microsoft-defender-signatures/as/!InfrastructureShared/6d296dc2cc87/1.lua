-- Threat: !InfrastructureShared
-- Name: 6d296dc2cc87
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
