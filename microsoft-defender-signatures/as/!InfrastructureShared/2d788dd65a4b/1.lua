-- Threat: !InfrastructureShared
-- Name: 2d788dd65a4b
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
