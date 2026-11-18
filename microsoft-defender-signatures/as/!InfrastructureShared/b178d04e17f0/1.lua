-- Threat: !InfrastructureShared
-- Name: b178d04e17f0
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
