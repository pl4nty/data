-- Threat: !InfrastructureShared
-- Name: 9e789d125135
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
