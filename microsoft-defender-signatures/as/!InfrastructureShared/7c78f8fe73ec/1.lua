-- Threat: !InfrastructureShared
-- Name: 7c78f8fe73ec
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
