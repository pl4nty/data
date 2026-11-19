-- Threat: !InfrastructureShared
-- Name: b9788d887d5f
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
