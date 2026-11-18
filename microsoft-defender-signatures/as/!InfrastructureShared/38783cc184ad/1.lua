-- Threat: !InfrastructureShared
-- Name: 38783cc184ad
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
