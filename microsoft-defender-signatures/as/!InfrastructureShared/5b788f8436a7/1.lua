-- Threat: !InfrastructureShared
-- Name: 5b788f8436a7
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
