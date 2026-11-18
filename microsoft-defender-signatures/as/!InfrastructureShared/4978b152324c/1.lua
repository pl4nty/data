-- Threat: !InfrastructureShared
-- Name: 4978b152324c
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
