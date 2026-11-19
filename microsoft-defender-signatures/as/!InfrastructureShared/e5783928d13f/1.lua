-- Threat: !InfrastructureShared
-- Name: e5783928d13f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
