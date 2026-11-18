-- Threat: !InfrastructureShared
-- Name: a478b2a3904f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
