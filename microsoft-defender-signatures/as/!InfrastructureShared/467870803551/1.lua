-- Threat: !InfrastructureShared
-- Name: 467870803551
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
