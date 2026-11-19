-- Threat: !InfrastructureShared
-- Name: b2788c630d6f
-- Type: 21

if peattributes.ismsil and peattributes.isdll and peattributes.locals_symbols_stripped then
  return mp.INFECTED
end
return mp.CLEAN
