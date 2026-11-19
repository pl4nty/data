-- Threat: !InfrastructureShared
-- Name: d278c3248b64
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
