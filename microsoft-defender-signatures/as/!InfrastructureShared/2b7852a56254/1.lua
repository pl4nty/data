-- Threat: !InfrastructureShared
-- Name: 2b7852a56254
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
