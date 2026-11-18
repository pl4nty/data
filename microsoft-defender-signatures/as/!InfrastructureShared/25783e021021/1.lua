-- Threat: !InfrastructureShared
-- Name: 25783e021021
-- Type: 21

if peattributes.isdll and peattributes.hasexports and mp.getfilesize() < 142000 then
  return mp.INFECTED
end
return mp.CLEAN
