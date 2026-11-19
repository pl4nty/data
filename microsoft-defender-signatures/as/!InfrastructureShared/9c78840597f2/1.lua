-- Threat: !InfrastructureShared
-- Name: 9c78840597f2
-- Type: 21

if peattributes.isexe == true and peattributes.no_security and pehdr.Subsystem == 3 then
  return mp.INFECTED
end
return mp.CLEAN
