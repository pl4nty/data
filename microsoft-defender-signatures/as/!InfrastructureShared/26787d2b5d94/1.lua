-- Threat: !InfrastructureShared
-- Name: 26787d2b5d94
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
