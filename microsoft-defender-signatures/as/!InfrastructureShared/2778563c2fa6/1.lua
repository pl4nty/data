-- Threat: !InfrastructureShared
-- Name: 2778563c2fa6
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
