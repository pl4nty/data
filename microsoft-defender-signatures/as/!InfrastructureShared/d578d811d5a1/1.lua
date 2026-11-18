-- Threat: !InfrastructureShared
-- Name: d578d811d5a1
-- Type: 21

if pesecs[5].Name == ".qtmetad" and pesecs[5].Characteristics == 1342177344 and pesecs[6].Name == ".qtmimed" and pesecs[6].Characteristics == 1342177344 then
  return mp.INFECTED
end
return mp.CLEAN
