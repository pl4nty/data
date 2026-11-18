-- Threat: !InfrastructureShared
-- Name: a5409f4159e5
-- Type: 21

if mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") then
  return mp.INFECTED
end
return mp.CLEAN
