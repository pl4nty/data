-- Threat: !InfrastructureShared
-- Name: 2d782c5926e5
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
