-- Threat: !InfrastructureShared
-- Name: 9778d822231d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
