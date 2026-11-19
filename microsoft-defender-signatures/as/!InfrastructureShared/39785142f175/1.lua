-- Threat: !InfrastructureShared
-- Name: 39785142f175
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and pesecs[4].Name == ".debug" and pesecs[4].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
