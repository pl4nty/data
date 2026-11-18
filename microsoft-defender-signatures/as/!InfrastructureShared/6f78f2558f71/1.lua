-- Threat: !InfrastructureShared
-- Name: 6f78f2558f71
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
