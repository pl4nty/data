-- Threat: !InfrastructureShared
-- Name: 57781fb01e8a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
