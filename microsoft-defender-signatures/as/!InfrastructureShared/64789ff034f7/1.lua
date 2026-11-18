-- Threat: !InfrastructureShared
-- Name: 64789ff034f7
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
