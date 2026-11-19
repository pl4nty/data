-- Threat: !InfrastructureShared
-- Name: 287851a09c6c
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
