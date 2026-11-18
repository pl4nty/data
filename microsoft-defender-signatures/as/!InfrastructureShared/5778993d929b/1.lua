-- Threat: !InfrastructureShared
-- Name: 5778993d929b
-- Type: 21

if epcode[1] == 139 and epcode[2] == 255 and peattributes.isdll == true and peattributes.hasexports == false and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
