-- Threat: !InfrastructureShared
-- Name: 4d780c5440cb
-- Type: 21

if mp.getfilesize() < 500000 and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
