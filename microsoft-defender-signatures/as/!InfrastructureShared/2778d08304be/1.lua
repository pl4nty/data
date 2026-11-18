-- Threat: !InfrastructureShared
-- Name: 2778d08304be
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
