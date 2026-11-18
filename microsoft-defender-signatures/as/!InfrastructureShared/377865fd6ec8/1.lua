-- Threat: !InfrastructureShared
-- Name: 377865fd6ec8
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
