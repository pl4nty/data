-- Threat: !InfrastructureShared
-- Name: 9d296c99c74b
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
