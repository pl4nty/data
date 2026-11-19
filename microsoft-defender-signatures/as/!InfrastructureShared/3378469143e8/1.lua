-- Threat: !InfrastructureShared
-- Name: 3378469143e8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
