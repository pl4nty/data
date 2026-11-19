-- Threat: !InfrastructureShared
-- Name: c878cf28d0e3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
