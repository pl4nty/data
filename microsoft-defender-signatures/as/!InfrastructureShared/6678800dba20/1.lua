-- Threat: !InfrastructureShared
-- Name: 6678800dba20
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
