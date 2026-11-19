-- Threat: !InfrastructureShared
-- Name: 3078e78c2fe4
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
