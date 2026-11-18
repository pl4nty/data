-- Threat: !InfrastructureShared
-- Name: 8178051ab61f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
