-- Threat: !InfrastructureShared
-- Name: 4478fba60659
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
