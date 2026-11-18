-- Threat: !InfrastructureShared
-- Name: 4d78f598db87
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
