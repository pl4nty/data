-- Threat: !InfrastructureShared
-- Name: 3a78dd5ef66e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
