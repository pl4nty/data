-- Threat: !InfrastructureShared
-- Name: 1067874c28865
-- Type: 21

if peattributes.ismsil and peattributes.x86_image and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
