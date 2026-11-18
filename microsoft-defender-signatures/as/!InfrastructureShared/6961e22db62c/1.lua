-- Threat: !InfrastructureShared
-- Name: 6961e22db62c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
