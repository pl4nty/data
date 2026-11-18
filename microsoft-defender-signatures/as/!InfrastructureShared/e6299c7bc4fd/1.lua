-- Threat: !InfrastructureShared
-- Name: e6299c7bc4fd
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
