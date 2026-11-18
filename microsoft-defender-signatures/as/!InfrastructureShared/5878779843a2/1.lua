-- Threat: !InfrastructureShared
-- Name: 5878779843a2
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
