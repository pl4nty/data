-- Threat: !InfrastructureShared
-- Name: 5f78ab914364
-- Type: 21

if peattributes.hasappendeddata and peattributes.entrybyte55 then
  return mp.INFECTED
end
return mp.CLEAN
