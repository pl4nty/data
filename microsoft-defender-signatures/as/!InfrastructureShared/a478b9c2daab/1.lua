-- Threat: !InfrastructureShared
-- Name: a478b9c2daab
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
