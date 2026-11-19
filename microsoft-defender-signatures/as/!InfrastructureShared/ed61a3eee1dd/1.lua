-- Threat: !InfrastructureShared
-- Name: ed61a3eee1dd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
