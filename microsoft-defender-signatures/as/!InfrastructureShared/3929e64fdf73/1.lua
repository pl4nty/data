-- Threat: !InfrastructureShared
-- Name: 3929e64fdf73
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
