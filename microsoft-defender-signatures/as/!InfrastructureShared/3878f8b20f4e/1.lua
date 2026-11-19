-- Threat: !InfrastructureShared
-- Name: 3878f8b20f4e
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
