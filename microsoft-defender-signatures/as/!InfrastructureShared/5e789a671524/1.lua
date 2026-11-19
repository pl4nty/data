-- Threat: !InfrastructureShared
-- Name: 5e789a671524
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
