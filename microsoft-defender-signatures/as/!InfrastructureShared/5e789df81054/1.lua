-- Threat: !InfrastructureShared
-- Name: 5e789df81054
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
