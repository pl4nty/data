-- Threat: !InfrastructureShared
-- Name: aa7873430164
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
