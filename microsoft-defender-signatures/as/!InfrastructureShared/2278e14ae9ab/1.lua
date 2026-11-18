-- Threat: !InfrastructureShared
-- Name: 2278e14ae9ab
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
