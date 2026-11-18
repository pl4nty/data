-- Threat: !InfrastructureShared
-- Name: 247819687fde
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
