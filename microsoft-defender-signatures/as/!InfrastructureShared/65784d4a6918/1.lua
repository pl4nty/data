-- Threat: !InfrastructureShared
-- Name: 65784d4a6918
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
