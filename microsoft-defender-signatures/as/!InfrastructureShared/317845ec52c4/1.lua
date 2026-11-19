-- Threat: !InfrastructureShared
-- Name: 317845ec52c4
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
