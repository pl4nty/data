-- Threat: !InfrastructureShared
-- Name: 407882a6625b
-- Type: 21

if pehdr.NumberOfSections == 4 and peattributes.isdll and peattributes.hasexports and peattributes.epinfirstsect then
  return mp.INFECTED
end
return mp.CLEAN
