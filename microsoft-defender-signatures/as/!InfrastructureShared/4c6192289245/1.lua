-- Threat: !InfrastructureShared
-- Name: 4c6192289245
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
