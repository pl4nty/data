-- Threat: !InfrastructureShared
-- Name: 3a782da6d980
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
