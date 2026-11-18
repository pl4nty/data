-- Threat: !InfrastructureShared
-- Name: 5a7838af0cf7
-- Type: 21

if peattributes.hasappendeddata and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
