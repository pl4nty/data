-- Threat: !InfrastructureShared
-- Name: 36787be90432
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
