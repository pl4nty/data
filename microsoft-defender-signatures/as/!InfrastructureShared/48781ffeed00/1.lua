-- Threat: !InfrastructureShared
-- Name: 48781ffeed00
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
