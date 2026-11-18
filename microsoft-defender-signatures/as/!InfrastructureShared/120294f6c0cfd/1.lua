-- Threat: !InfrastructureShared
-- Name: 120294f6c0cfd
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
