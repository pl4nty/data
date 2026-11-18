-- Threat: !InfrastructureShared
-- Name: 41784cde84ec
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
