-- Threat: !InfrastructureShared
-- Name: 1678bb78cb06
-- Type: 21

if epcode[1] == 246 and epcode[2] == 195 and epcode[3] == 1 and epcode[4] == 116 and peattributes.isexe and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
