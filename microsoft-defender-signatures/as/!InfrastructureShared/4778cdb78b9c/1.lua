-- Threat: !InfrastructureShared
-- Name: 4778cdb78b9c
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() == 82944 then
  return mp.INFECTED
end
return mp.CLEAN
