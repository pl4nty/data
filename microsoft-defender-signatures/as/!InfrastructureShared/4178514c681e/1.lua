-- Threat: !InfrastructureShared
-- Name: 4178514c681e
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
