-- Threat: !InfrastructureShared
-- Name: 5b61601a9c54
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
