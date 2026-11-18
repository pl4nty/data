-- Threat: !InfrastructureShared
-- Name: 5f784ccfadf9
-- Type: 21

if pehdr.NumberOfSections == 11 and pesecs[7].Name == ".app0" and pesecs[9].Name == ".app1" and pesecs[10].Name == ".app2" then
  return mp.INFECTED
end
return mp.CLEAN
