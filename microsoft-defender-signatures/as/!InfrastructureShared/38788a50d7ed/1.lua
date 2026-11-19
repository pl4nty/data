-- Threat: !InfrastructureShared
-- Name: 38788a50d7ed
-- Type: 21

if peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
