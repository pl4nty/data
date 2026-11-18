-- Threat: !InfrastructureShared
-- Name: 13784c6a1d22
-- Type: 21

if epcode[1] == 235 and epcode[2] == 8 and epcode[3] == 15 and epcode[4] == 148 and peattributes.isexe and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
