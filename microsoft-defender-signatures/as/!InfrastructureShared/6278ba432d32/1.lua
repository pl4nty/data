-- Threat: !InfrastructureShared
-- Name: 6278ba432d32
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
