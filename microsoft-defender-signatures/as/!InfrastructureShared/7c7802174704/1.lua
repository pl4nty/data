-- Threat: !InfrastructureShared
-- Name: 7c7802174704
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
