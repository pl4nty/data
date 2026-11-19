-- Threat: !InfrastructureShared
-- Name: 1c8787d55010a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security and pehdr.Subsystem == 3 then
  return mp.INFECTED
end
return mp.CLEAN
