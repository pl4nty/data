-- Threat: !InfrastructureShared
-- Name: b978da8136f7
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
