-- Threat: !InfrastructureShared
-- Name: 2b786db64d42
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
