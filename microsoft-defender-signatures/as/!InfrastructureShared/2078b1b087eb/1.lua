-- Threat: !InfrastructureShared
-- Name: 2078b1b087eb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
