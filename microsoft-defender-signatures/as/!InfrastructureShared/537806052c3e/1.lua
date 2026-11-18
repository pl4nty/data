-- Threat: !InfrastructureShared
-- Name: 537806052c3e
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
