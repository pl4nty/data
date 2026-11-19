-- Threat: !InfrastructureShared
-- Name: 5a78ed8db3e5
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
