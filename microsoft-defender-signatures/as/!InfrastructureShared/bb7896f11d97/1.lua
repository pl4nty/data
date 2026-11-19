-- Threat: !InfrastructureShared
-- Name: bb7896f11d97
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
