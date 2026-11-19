-- Threat: !InfrastructureShared
-- Name: 29787139b175
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
