-- Threat: !InfrastructureShared
-- Name: 227863fd02e4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
