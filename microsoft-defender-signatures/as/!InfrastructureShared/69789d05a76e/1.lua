-- Threat: !InfrastructureShared
-- Name: 69789d05a76e
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
