-- Threat: !InfrastructureShared
-- Name: 18178064ef41a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
