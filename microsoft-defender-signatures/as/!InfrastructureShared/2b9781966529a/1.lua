-- Threat: !InfrastructureShared
-- Name: 2b9781966529a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
