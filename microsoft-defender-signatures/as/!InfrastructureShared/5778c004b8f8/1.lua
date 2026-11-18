-- Threat: !InfrastructureShared
-- Name: 5778c004b8f8
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
