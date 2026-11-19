-- Threat: !InfrastructureShared
-- Name: 9829e36c9fc3
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
