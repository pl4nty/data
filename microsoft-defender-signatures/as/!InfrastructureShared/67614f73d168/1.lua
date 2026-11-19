-- Threat: !InfrastructureShared
-- Name: 67614f73d168
-- Type: 21

if mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") then
  return mp.INFECTED
end
return mp.CLEAN
