-- Threat: !InfrastructureShared
-- Name: 5f786729559b
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
