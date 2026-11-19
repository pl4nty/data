-- Threat: !InfrastructureShared
-- Name: 4d78a0de72c4
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
