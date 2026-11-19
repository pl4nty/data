-- Threat: !InfrastructureShared
-- Name: 8178d239f3ed
-- Type: 21

if peattributes.isexe and peattributes.no_security and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
