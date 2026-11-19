-- Threat: !InfrastructureShared
-- Name: 887881ffc52e
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
