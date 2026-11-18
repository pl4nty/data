-- Threat: !InfrastructureShared
-- Name: 2a785d6f8d0d
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
