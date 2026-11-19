-- Threat: !InfrastructureShared
-- Name: 15a78932e81d6
-- Type: 21

if peattributes.isdll and peattributes.no_exports then
  return mp.INFECTED
end
return mp.CLEAN
