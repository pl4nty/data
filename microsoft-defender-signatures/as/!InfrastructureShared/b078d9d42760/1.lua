-- Threat: !InfrastructureShared
-- Name: b078d9d42760
-- Type: 21

if peattributes.ismsil and mp.get_mpattribute("pea_no_security") and mp.get_mpattribute("SIGATTR:MSIL/LoadPEBase64.J") then
  return mp.INFECTED
end
return mp.CLEAN
