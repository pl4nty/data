-- Threat: !InfrastructureShared
-- Name: 6d783ee8f6e3
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
