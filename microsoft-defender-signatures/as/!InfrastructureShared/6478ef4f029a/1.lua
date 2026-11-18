-- Threat: !InfrastructureShared
-- Name: 6478ef4f029a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
