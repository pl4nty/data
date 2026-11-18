-- Threat: !InfrastructureShared
-- Name: 7b78fba910ce
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
