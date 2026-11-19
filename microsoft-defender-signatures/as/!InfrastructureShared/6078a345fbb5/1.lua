-- Threat: !InfrastructureShared
-- Name: 6078a345fbb5
-- Type: 21

if pehdr.NumberOfSections == 10 and pesecs[8].Name == ".crt1" then
  return mp.INFECTED
end
return mp.CLEAN
