-- Threat: !InfrastructureShared
-- Name: 86780d8151f6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
