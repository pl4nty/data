-- Threat: !InfrastructureShared
-- Name: 2478bc26fff7
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
