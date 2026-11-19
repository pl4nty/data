-- Threat: !InfrastructureShared
-- Name: 3b78c7ae5c12
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
