-- Threat: !InfrastructureShared
-- Name: 4c7886993612
-- Type: 21

if peattributes.x86_image == true and (peattributes.isdll == true or peattributes.isexe == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
