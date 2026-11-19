-- Threat: !InfrastructureShared
-- Name: b378147c6055
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
