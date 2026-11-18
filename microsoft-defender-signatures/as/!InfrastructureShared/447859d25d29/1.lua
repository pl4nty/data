-- Threat: !InfrastructureShared
-- Name: 447859d25d29
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
