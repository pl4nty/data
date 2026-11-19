-- Threat: !InfrastructureShared
-- Name: 4478f0a828fa
-- Type: 21

if peattributes.isexe and peattributes.no_security and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
