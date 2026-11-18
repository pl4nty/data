-- Threat: !InfrastructureShared
-- Name: 587800280fad
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
