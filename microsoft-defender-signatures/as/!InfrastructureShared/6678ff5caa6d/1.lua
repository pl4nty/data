-- Threat: !InfrastructureShared
-- Name: 6678ff5caa6d
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
