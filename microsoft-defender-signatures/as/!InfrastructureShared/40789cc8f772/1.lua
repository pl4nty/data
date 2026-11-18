-- Threat: !InfrastructureShared
-- Name: 40789cc8f772
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
