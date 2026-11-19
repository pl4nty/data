-- Threat: !InfrastructureShared
-- Name: 99786110550f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
