-- Threat: !InfrastructureShared
-- Name: 2078c2948993
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
