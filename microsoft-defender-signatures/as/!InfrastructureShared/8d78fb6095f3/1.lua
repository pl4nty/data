-- Threat: !InfrastructureShared
-- Name: 8d78fb6095f3
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
