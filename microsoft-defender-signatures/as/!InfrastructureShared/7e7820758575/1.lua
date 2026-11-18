-- Threat: !InfrastructureShared
-- Name: 7e7820758575
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
