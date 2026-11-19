-- Threat: !InfrastructureShared
-- Name: 5978276959ec
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
