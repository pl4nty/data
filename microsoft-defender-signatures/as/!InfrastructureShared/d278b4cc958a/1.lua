-- Threat: !InfrastructureShared
-- Name: d278b4cc958a
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
