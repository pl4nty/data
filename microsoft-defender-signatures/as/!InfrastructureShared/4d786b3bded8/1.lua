-- Threat: !InfrastructureShared
-- Name: 4d786b3bded8
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
