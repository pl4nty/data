-- Threat: !InfrastructureShared
-- Name: 427888a8264a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
