-- Threat: !InfrastructureShared
-- Name: c77870916353
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
