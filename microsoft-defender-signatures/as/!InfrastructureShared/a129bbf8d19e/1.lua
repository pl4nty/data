-- Threat: !InfrastructureShared
-- Name: a129bbf8d19e
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
