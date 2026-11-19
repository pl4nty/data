-- Threat: !InfrastructureShared
-- Name: 2b78cbe7dfb8
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
