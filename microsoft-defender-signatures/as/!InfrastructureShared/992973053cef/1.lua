-- Threat: !InfrastructureShared
-- Name: 992973053cef
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
