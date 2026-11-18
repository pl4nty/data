-- Threat: !InfrastructureShared
-- Name: 347875ac4637
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
