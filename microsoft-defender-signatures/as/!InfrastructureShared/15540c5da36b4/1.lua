-- Threat: !InfrastructureShared
-- Name: 15540c5da36b4
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
