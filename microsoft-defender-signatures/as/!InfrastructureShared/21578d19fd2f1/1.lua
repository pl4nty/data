-- Threat: !InfrastructureShared
-- Name: 21578d19fd2f1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
