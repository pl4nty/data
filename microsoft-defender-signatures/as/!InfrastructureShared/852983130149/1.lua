-- Threat: !InfrastructureShared
-- Name: 852983130149
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
