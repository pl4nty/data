-- Threat: !InfrastructureShared
-- Name: 32782d9eebd8
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
