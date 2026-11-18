-- Threat: !InfrastructureShared
-- Name: c578b21d4913
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
