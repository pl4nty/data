-- Threat: !InfrastructureShared
-- Name: 7e78cde14fdb
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
