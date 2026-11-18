-- Threat: !InfrastructureShared
-- Name: 1978f52d6f23
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") and mp.get_mpattribute("BM_HAS_DIGITALSIGNATURE") then
  return mp.INFECTED
end
return mp.CLEAN
