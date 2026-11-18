-- Threat: !InfrastructureShared
-- Name: 397853e9d8c9
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
