-- Threat: !InfrastructureShared
-- Name: 57783adc9fec
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
