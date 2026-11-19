-- Threat: !InfrastructureShared
-- Name: 2e78394b697e
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
