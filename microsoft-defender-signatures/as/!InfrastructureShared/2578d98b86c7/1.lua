-- Threat: !InfrastructureShared
-- Name: 2578d98b86c7
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
