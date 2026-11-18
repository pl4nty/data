-- Threat: !InfrastructureShared
-- Name: 10540a0eaf9e2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
