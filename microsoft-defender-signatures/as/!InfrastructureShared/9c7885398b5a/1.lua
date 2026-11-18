-- Threat: !InfrastructureShared
-- Name: 9c7885398b5a
-- Type: 21

if peattributes.isexe and peattributes.no_security and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
