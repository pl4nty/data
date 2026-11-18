-- Threat: !InfrastructureShared
-- Name: cb7865cf8d40
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
