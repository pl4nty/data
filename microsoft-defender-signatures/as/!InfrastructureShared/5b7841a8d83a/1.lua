-- Threat: !InfrastructureShared
-- Name: 5b7841a8d83a
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
