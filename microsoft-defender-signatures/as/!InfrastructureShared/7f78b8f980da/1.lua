-- Threat: !InfrastructureShared
-- Name: 7f78b8f980da
-- Type: 21
-- Flags: 1

if peattributes.isvbpcode ~= true and peattributes.isvbnative ~= true then
  return mp.CLEAN
end
if peattributes.isdll == true then
  return mp.CLEAN
end
if mp.getfilesize() > 512000 then
  return mp.CLEAN
end
if hstrlog[4].hitcount > 50 then
  return mp.CLEAN
end
return mp.INFECTED
