-- Threat: !InfrastructureShared
-- Name: 7f78840ad685
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
