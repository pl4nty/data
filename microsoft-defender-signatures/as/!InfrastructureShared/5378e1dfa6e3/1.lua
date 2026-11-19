-- Threat: !InfrastructureShared
-- Name: 5378e1dfa6e3
-- Type: 21

if peattributes.no_security and peattributes.isdll and mp.getfilesize() < 16500 then
  return mp.INFECTED
end
return mp.CLEAN
