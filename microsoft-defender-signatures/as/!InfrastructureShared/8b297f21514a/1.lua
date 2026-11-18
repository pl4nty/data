-- Threat: !InfrastructureShared
-- Name: 8b297f21514a
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
