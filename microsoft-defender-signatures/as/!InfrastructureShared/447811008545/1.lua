-- Threat: !InfrastructureShared
-- Name: 447811008545
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
