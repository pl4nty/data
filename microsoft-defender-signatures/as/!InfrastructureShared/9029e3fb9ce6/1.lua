-- Threat: !InfrastructureShared
-- Name: 9029e3fb9ce6
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
