-- Threat: !InfrastructureShared
-- Name: 5f7857e70f14
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
