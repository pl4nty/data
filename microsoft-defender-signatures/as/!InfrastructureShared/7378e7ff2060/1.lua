-- Threat: !InfrastructureShared
-- Name: 7378e7ff2060
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
