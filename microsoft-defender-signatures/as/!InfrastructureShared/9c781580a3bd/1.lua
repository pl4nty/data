-- Threat: !InfrastructureShared
-- Name: 9c781580a3bd
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
