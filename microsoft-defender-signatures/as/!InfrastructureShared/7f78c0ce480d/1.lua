-- Threat: !InfrastructureShared
-- Name: 7f78c0ce480d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
