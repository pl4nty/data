-- Threat: !InfrastructureShared
-- Name: b0298e5a4671
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
