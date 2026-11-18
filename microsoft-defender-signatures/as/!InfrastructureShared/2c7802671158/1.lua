-- Threat: !InfrastructureShared
-- Name: 2c7802671158
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
