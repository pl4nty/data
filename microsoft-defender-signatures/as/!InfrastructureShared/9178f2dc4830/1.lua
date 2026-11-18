-- Threat: !InfrastructureShared
-- Name: 9178f2dc4830
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
