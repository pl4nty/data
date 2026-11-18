-- Threat: !InfrastructureShared
-- Name: 3e78e8557ef6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
