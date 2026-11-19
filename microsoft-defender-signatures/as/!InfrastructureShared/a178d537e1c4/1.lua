-- Threat: !InfrastructureShared
-- Name: a178d537e1c4
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 148000 and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
