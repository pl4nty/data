-- Threat: !InfrastructureShared
-- Name: 227811712eec
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
