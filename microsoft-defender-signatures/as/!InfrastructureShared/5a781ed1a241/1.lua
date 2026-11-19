-- Threat: !InfrastructureShared
-- Name: 5a781ed1a241
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
