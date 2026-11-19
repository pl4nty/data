-- Threat: !InfrastructureShared
-- Name: 907848445659
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
