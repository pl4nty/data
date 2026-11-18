-- Threat: !InfrastructureShared
-- Name: 6578787fe92a
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
