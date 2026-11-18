-- Threat: !InfrastructureShared
-- Name: d57880c99d05
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
