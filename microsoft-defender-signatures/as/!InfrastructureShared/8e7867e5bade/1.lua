-- Threat: !InfrastructureShared
-- Name: 8e7867e5bade
-- Type: 21

if peattributes.isdll and peattributes.hasexports and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
