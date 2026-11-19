-- Threat: !InfrastructureShared
-- Name: 30786d0986ba
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
