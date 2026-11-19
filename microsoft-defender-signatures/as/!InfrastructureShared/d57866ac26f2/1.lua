-- Threat: !InfrastructureShared
-- Name: d57866ac26f2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
