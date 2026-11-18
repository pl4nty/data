-- Threat: !InfrastructureShared
-- Name: 46780cbde2e5
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
