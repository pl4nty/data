-- Threat: !InfrastructureShared
-- Name: 7b78bc9641c2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
