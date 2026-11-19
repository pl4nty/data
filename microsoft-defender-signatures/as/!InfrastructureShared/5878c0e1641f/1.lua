-- Threat: !InfrastructureShared
-- Name: 5878c0e1641f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
