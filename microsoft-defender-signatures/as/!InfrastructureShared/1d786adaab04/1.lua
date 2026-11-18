-- Threat: !InfrastructureShared
-- Name: 1d786adaab04
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
