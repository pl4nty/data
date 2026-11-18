-- Threat: !InfrastructureShared
-- Name: a278e1930173
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
