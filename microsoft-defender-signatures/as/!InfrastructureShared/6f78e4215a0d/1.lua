-- Threat: !InfrastructureShared
-- Name: 6f78e4215a0d
-- Type: 21

if peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
