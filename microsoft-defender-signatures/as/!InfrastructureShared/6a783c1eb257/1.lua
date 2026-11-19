-- Threat: !InfrastructureShared
-- Name: 6a783c1eb257
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
