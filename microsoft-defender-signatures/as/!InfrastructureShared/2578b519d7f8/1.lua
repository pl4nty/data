-- Threat: !InfrastructureShared
-- Name: 2578b519d7f8
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
