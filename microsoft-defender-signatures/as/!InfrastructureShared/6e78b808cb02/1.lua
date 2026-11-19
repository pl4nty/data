-- Threat: !InfrastructureShared
-- Name: 6e78b808cb02
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
