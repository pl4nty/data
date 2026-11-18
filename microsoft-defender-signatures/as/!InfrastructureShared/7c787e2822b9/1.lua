-- Threat: !InfrastructureShared
-- Name: 7c787e2822b9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
