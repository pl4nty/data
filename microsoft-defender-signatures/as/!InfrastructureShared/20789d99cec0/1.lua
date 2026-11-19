-- Threat: !InfrastructureShared
-- Name: 20789d99cec0
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
