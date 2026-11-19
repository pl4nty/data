-- Threat: !InfrastructureShared
-- Name: 7f784e27ff8a
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
