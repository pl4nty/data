-- Threat: !InfrastructureShared
-- Name: 111780f0e7cf4
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
