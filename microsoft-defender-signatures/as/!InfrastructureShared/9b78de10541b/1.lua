-- Threat: !InfrastructureShared
-- Name: 9b78de10541b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
