-- Threat: !InfrastructureShared
-- Name: cd781053b862
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
