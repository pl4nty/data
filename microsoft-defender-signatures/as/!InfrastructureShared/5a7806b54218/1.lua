-- Threat: !InfrastructureShared
-- Name: 5a7806b54218
-- Type: 21

if mp.getfilesize() > 11776 and mp.getfilesize() < 15104 and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
