-- Threat: !InfrastructureShared
-- Name: 8c29b9b8709c
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
