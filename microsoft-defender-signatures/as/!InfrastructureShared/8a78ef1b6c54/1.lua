-- Threat: !InfrastructureShared
-- Name: 8a78ef1b6c54
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
