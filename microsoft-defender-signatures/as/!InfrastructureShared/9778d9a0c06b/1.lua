-- Threat: !InfrastructureShared
-- Name: 9778d9a0c06b
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
