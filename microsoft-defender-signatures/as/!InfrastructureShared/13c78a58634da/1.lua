-- Threat: !InfrastructureShared
-- Name: 13c78a58634da
-- Type: 21

if peattributes.no_security and peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
