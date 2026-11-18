-- Threat: !InfrastructureShared
-- Name: 30789d89ac53
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
