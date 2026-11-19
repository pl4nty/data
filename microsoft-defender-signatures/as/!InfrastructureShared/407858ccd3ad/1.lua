-- Threat: !InfrastructureShared
-- Name: 407858ccd3ad
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
