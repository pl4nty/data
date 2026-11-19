-- Threat: !InfrastructureShared
-- Name: 4078361fbeab
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
