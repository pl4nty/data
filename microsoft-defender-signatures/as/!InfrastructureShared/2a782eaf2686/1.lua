-- Threat: !InfrastructureShared
-- Name: 2a782eaf2686
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
