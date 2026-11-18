-- Threat: !InfrastructureShared
-- Name: 2278f1c57bfe
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
