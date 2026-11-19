-- Threat: !InfrastructureShared
-- Name: 8f7815754da8
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
