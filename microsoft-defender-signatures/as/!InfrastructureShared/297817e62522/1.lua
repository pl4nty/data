-- Threat: !InfrastructureShared
-- Name: 297817e62522
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
