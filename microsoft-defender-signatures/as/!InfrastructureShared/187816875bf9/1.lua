-- Threat: !InfrastructureShared
-- Name: 187816875bf9
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
