-- Threat: !InfrastructureShared
-- Name: 2588f43aa0267
-- Type: 21

if mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
