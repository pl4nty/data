-- Threat: !InfrastructureShared
-- Name: 15d578f2826d43
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
