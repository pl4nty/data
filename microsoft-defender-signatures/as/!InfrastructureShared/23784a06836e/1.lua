-- Threat: !InfrastructureShared
-- Name: 23784a06836e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
