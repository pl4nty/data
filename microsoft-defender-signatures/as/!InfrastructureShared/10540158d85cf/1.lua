-- Threat: !InfrastructureShared
-- Name: 10540158d85cf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
