-- Threat: !InfrastructureShared
-- Name: 6e294e761fb7
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
