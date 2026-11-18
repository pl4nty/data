-- Threat: !InfrastructureShared
-- Name: 29781fdd4036
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
