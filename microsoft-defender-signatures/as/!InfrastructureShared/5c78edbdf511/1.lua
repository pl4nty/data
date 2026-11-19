-- Threat: !InfrastructureShared
-- Name: 5c78edbdf511
-- Type: 21

if peattributes.no_security and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
