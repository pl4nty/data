-- Threat: !InfrastructureShared
-- Name: e54021f1b663
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
