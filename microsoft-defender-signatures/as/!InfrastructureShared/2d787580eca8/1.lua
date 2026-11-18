-- Threat: !InfrastructureShared
-- Name: 2d787580eca8
-- Type: 21

if peattributes.isdll and peattributes.hasexports and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
