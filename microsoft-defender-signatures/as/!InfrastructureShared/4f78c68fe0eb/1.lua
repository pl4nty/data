-- Threat: !InfrastructureShared
-- Name: 4f78c68fe0eb
-- Type: 21

if mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") and not mp.get_mpattribute("Lua:Issuer.Microsoft") then
  return mp.INFECTED
end
return mp.CLEAN
