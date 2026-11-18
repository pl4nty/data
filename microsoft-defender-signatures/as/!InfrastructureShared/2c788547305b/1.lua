-- Threat: !InfrastructureShared
-- Name: 2c788547305b
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
