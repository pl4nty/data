-- Threat: !InfrastructureShared
-- Name: 2778a758db58
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
