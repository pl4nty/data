-- Threat: !InfrastructureShared
-- Name: 3b78bd279259
-- Type: 21

if epcode[1] == 83 and epcode[2] == 156 and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
