-- Threat: !InfrastructureShared
-- Name: 5a789fc94e96
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
