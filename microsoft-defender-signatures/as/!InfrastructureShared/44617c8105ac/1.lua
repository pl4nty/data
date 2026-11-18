-- Threat: !InfrastructureShared
-- Name: 44617c8105ac
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
