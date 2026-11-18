-- Threat: !InfrastructureShared
-- Name: af78ea6e2ec0
-- Type: 21
-- Flags: 1

if pehdr.NumberOfSections == 6 and pesecs[6].Name == ".rsrc" and pesecs[6].VirtualSize >= 199968 and pesecs[6].VirtualSize <= 200144 then
  return mp.INFECTED
end
return mp.SUSPICIOUS
