-- Threat: !InfrastructureShared
-- Name: dc78c4380cad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
