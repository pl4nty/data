-- Threat: !InfrastructureShared
-- Name: 1c78d89c6cc8
-- Type: 21

if epcode[1] == 83 and epcode[2] == 85 and epcode[3] == 187 and epcode[4] == 149 and epcode[5] == 31 and peattributes.isexe and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
