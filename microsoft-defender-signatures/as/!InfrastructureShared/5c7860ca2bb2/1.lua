-- Threat: !InfrastructureShared
-- Name: 5c7860ca2bb2
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
