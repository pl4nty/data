-- Threat: !InfrastructureShared
-- Name: 11178397cc923
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
