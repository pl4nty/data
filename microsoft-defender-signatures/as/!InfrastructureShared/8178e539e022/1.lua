-- Threat: !InfrastructureShared
-- Name: 8178e539e022
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
