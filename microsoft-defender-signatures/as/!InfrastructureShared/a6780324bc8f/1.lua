-- Threat: !InfrastructureShared
-- Name: a6780324bc8f
-- Type: 21

if peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
