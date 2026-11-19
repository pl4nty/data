-- Threat: !InfrastructureShared
-- Name: a078ef4c8b80
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
