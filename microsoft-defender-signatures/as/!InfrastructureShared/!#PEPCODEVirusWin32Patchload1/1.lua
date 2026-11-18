-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Virus:Win32/Patchload.1
-- Type: 8

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.epscn_islast ~= true then
  return mp.CLEAN
end
if peattributes.lastscn_writable ~= true then
  return mp.CLEAN
end
if epcode[1] ~= 128 then
  return mp.CLEAN
end
if epcode[2] ~= 124 then
  return mp.CLEAN
end
if epcode[3] ~= 36 then
  return mp.CLEAN
end
if epcode[5] ~= 1 then
  return mp.CLEAN
end
if epcode[6] ~= 117 then
  return mp.CLEAN
end
return mp.INFECTED
