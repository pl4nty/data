-- Threat: !InfrastructureShared
-- Name: ea78192f9fc0
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
