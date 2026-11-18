-- Threat: !InfrastructureShared
-- Name: 6b78dc80bf09
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
