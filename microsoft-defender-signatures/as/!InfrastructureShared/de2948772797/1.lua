-- Threat: !InfrastructureShared
-- Name: de2948772797
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
