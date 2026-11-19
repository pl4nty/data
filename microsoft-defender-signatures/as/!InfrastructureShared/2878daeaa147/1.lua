-- Threat: !InfrastructureShared
-- Name: 2878daeaa147
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
