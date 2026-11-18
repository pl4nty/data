-- Threat: !InfrastructureShared
-- Name: ba7802dac2fa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
