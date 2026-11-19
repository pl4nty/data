-- Threat: !InfrastructureShared
-- Name: 4b78a1ef7f60
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
