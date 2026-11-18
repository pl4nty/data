-- Threat: !InfrastructureShared
-- Name: 2e7838fa68a6
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
