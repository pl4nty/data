-- Threat: !InfrastructureShared
-- Name: 20b783c99584d
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
