-- Threat: !InfrastructureShared
-- Name: 5f78758e63e6
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
