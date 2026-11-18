-- Threat: !InfrastructureShared
-- Name: 4a6170e0cd00
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
