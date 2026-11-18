-- Threat: !InfrastructureShared
-- Name: 2a782cbc3e70
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
