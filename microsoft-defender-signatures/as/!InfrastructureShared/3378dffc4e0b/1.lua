-- Threat: !InfrastructureShared
-- Name: 3378dffc4e0b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
