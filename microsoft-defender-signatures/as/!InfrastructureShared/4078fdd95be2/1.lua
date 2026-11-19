-- Threat: !InfrastructureShared
-- Name: 4078fdd95be2
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
