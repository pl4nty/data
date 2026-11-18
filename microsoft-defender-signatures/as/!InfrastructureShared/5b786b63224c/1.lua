-- Threat: !InfrastructureShared
-- Name: 5b786b63224c
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
