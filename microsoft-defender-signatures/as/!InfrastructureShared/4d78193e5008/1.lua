-- Threat: !InfrastructureShared
-- Name: 4d78193e5008
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
