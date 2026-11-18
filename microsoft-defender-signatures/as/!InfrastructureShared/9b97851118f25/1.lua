-- Threat: !InfrastructureShared
-- Name: 9b97851118f25
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
