-- Threat: !InfrastructureShared
-- Name: 3a78a983c284
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
