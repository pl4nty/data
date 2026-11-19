-- Threat: !InfrastructureShared
-- Name: 4678d622812b
-- Type: 21

if peattributes.x86_image == true and (peattributes.isdll == true or peattributes.isexe == true) and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
