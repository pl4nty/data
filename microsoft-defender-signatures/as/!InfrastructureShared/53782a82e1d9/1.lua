-- Threat: !InfrastructureShared
-- Name: 53782a82e1d9
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
