-- Threat: !InfrastructureShared
-- Name: 7d7876c62c9e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
