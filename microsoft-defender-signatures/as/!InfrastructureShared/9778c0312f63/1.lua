-- Threat: !InfrastructureShared
-- Name: 9778c0312f63
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
