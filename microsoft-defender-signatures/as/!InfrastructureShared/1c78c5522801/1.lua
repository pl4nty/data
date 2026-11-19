-- Threat: !InfrastructureShared
-- Name: 1c78c5522801
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
