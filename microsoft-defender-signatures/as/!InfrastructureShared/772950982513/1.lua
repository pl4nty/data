-- Threat: !InfrastructureShared
-- Name: 772950982513
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
