-- Threat: !InfrastructureShared
-- Name: 9c78176b1905
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
