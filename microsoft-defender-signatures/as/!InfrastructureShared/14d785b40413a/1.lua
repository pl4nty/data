-- Threat: !InfrastructureShared
-- Name: 14d785b40413a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
