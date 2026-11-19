-- Threat: !InfrastructureShared
-- Name: b329ff4818c2
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
