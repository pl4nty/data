-- Threat: !InfrastructureShared
-- Name: 99785a069d81
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
