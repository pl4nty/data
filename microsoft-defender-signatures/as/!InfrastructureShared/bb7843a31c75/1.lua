-- Threat: !InfrastructureShared
-- Name: bb7843a31c75
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
