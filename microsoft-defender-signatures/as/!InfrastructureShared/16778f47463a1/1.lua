-- Threat: !InfrastructureShared
-- Name: 16778f47463a1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
