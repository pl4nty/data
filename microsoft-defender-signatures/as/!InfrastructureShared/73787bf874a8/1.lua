-- Threat: !InfrastructureShared
-- Name: 73787bf874a8
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
