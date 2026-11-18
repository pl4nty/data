-- Threat: !InfrastructureShared
-- Name: 247876faa5cf
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
