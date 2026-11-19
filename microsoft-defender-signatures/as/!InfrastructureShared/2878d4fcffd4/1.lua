-- Threat: !InfrastructureShared
-- Name: 2878d4fcffd4
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
