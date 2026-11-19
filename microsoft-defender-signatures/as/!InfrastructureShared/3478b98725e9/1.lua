-- Threat: !InfrastructureShared
-- Name: 3478b98725e9
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
