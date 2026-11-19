-- Threat: !InfrastructureShared
-- Name: ac787fd9e7b7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
