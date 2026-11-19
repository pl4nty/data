-- Threat: !InfrastructureShared
-- Name: 1c978043a2c7d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
