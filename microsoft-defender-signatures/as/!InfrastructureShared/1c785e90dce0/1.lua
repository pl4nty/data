-- Threat: !InfrastructureShared
-- Name: 1c785e90dce0
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
