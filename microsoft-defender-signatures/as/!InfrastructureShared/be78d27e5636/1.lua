-- Threat: !InfrastructureShared
-- Name: be78d27e5636
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
