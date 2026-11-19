-- Threat: !InfrastructureShared
-- Name: 123617a5d5f1a
-- Type: 21

if peattributes.no_security == true and peattributes.no_exports == true and peattributes.headerchecksum0 == true and peattributes.entrybyte55 == true and peattributes.no_exception == true then
  return mp.INFECTED
end
return mp.CLEAN
