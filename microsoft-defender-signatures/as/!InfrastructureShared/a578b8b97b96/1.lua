-- Threat: !InfrastructureShared
-- Name: a578b8b97b96
-- Type: 21
-- Flags: 1

if pehdr.NumberOfSections == 5 and peattributes.epinfirstsect and peattributes.hasappendeddata then
  return mp.INFECTED
end
return mp.SUSPICIOUS
