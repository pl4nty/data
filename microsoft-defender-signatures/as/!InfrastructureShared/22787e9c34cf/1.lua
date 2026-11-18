-- Threat: !InfrastructureShared
-- Name: 22787e9c34cf
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
