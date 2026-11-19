-- Threat: !InfrastructureShared
-- Name: 101785cc266ed
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
