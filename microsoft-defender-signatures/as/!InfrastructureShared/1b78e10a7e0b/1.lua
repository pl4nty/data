-- Threat: !InfrastructureShared
-- Name: 1b78e10a7e0b
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
