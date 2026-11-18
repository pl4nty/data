-- Threat: !InfrastructureShared
-- Name: 2c78cdffb53a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
