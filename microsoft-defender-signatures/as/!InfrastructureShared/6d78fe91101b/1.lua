-- Threat: !InfrastructureShared
-- Name: 6d78fe91101b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
