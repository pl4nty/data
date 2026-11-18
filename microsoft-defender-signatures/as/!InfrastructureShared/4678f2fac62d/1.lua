-- Threat: !InfrastructureShared
-- Name: 4678f2fac62d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
