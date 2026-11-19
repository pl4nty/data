-- Threat: !InfrastructureShared
-- Name: b7781c232893
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
