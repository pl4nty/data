-- Threat: !InfrastructureShared
-- Name: 4278562b53e8
-- Type: 21

if mp.get_mpattribute("BM_MZ_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
