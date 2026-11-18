-- Threat: !InfrastructureShared
-- Name: 1054011ba1d2f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
