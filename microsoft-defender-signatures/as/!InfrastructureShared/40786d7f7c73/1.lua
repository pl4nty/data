-- Threat: !InfrastructureShared
-- Name: 40786d7f7c73
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
