-- Threat: !InfrastructureShared
-- Name: 6478315c89f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
