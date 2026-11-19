-- Threat: !InfrastructureShared
-- Name: 5478e6403deb
-- Type: 21

if pesecs[7].Name == ".EGlobal" and pesecs[8].Name == ".EGlobal" then
  return mp.INFECTED
end
return mp.CLEAN
