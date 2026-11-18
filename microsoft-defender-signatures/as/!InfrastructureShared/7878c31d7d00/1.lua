-- Threat: !InfrastructureShared
-- Name: 7878c31d7d00
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
