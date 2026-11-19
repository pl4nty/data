-- Threat: !InfrastructureShared
-- Name: 6278b03dac2c
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
