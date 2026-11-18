-- Threat: !InfrastructureShared
-- Name: 57619b6451a7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
