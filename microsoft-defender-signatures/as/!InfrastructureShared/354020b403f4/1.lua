-- Threat: !InfrastructureShared
-- Name: 354020b403f4
-- Type: 21

if peattributes.isvbpcode ~= true then
  return mp.CLEAN
end
if mp.getfilesize() > 512000 then
  return mp.CLEAN
end
return mp.INFECTED
