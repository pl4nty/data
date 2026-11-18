-- Threat: !InfrastructureShared
-- Name: 4978b2970ccd
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
