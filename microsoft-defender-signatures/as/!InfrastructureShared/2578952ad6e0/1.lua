-- Threat: !InfrastructureShared
-- Name: 2578952ad6e0
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
