-- Threat: !InfrastructureShared
-- Name: 1c781a8f1537
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
