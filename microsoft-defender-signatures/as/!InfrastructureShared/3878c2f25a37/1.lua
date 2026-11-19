-- Threat: !InfrastructureShared
-- Name: 3878c2f25a37
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
