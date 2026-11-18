-- Threat: !InfrastructureShared
-- Name: 4378e887c192
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
