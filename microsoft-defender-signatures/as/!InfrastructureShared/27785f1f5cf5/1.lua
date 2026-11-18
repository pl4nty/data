-- Threat: !InfrastructureShared
-- Name: 27785f1f5cf5
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
