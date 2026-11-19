-- Threat: !InfrastructureShared
-- Name: 9c781c0f6168
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
