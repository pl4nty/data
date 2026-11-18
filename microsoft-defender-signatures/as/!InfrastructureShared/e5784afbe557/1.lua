-- Threat: !InfrastructureShared
-- Name: e5784afbe557
-- Type: 21

if peattributes.no_security == true and (pehdr.NumberOfSections >= 5 or pehdr.NumberOfSections <= 7) then
  return mp.INFECTED
end
return mp.CLEAN
