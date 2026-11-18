-- Threat: !InfrastructureShared
-- Name: 6278326c427f
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and pehdr.NumberOfSections > 0 and pehdr.NumberOfSections < 10 and pesecs[5].Name == ".r4v3n0" and pesecs[6].Name == ".r4v3n1" and pesecs[7].Name == ".r4v3n2" then
  return mp.INFECTED
end
return mp.CLEAN
