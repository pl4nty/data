-- Threat: !InfrastructureShared
-- Name: 8278203a5891
-- Type: 21

if peattributes.no_security and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
