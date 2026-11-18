-- Threat: !InfrastructureShared
-- Name: 5f619d137763
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
