-- Threat: !InfrastructureShared
-- Name: 5478c2dc3610
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
