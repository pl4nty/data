-- Threat: !InfrastructureShared
-- Name: 40297941a48b
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
