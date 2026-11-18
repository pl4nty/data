-- Threat: !InfrastructureShared
-- Name: 9c785c8895ed
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
