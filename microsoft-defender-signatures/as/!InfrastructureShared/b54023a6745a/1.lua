-- Threat: !InfrastructureShared
-- Name: b54023a6745a
-- Type: 21

if mp.getfilesize() > 131072 or peattributes.isvbpcode ~= true then
  return mp.CLEAN
end
return mp.INFECTED
