-- Threat: !InfrastructureShared
-- Name: 6c78c9e096ed
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
