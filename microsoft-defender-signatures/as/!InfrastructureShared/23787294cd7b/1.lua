-- Threat: !InfrastructureShared
-- Name: 23787294cd7b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
