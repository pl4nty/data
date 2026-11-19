-- Threat: !InfrastructureShared
-- Name: 5e788c8ab377
-- Type: 21

if mp.getfilesize() > 227000 and mp.getfilesize() < 240000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
