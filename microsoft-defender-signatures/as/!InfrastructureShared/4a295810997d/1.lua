-- Threat: !InfrastructureShared
-- Name: 4a295810997d
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
