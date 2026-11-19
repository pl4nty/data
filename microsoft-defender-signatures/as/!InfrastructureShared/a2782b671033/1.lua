-- Threat: !InfrastructureShared
-- Name: a2782b671033
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
