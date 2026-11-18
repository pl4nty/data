-- Threat: !InfrastructureShared
-- Name: 7178ce4a08b8
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
