-- Threat: !InfrastructureShared
-- Name: 9e78bb8f050d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
