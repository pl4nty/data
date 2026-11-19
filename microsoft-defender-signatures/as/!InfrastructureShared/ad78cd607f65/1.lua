-- Threat: !InfrastructureShared
-- Name: ad78cd607f65
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
