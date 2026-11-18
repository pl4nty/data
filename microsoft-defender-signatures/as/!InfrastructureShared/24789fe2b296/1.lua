-- Threat: !InfrastructureShared
-- Name: 24789fe2b296
-- Type: 21

if peattributes.no_security and peattributes.isexe and mp.getfilesize() > 10000000 then
  return mp.INFECTED
end
return mp.CLEAN
