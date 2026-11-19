-- Threat: !InfrastructureShared
-- Name: 4278494926d0
-- Type: 21

if pevars.epsec == 5 and pesecs[pevars.epsec].Name == ".gfcd" then
  return mp.INFECTED
end
return mp.CLEAN
