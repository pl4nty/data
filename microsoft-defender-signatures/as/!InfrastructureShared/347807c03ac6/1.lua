-- Threat: !InfrastructureShared
-- Name: 347807c03ac6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
