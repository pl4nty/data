-- Threat: !InfrastructureShared
-- Name: 9578ae4675b1
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 22000 then
  return mp.INFECTED
end
return mp.CLEAN
