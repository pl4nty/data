-- Threat: !InfrastructureShared
-- Name: 4f786a622821
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
