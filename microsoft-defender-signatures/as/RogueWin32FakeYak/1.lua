-- Threat: Rogue:Win32/FakeYak
-- Type: 8

if peattributes.epscn_valign == true then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if epcode[1] ~= 144 then
  return mp.CLEAN
end
if epcode[2] ~= 139 then
  return mp.CLEAN
end
if epcode[3] ~= 12 then
  return mp.CLEAN
end
if epcode[4] ~= 36 then
  return mp.CLEAN
end
if epcode[5] ~= 51 then
  return mp.CLEAN
end
if epcode[6] ~= 192 then
  return mp.CLEAN
end
if epcode[7] ~= 72 then
  return mp.CLEAN
end
if epcode[8] ~= 102 then
  return mp.CLEAN
end
if epcode[9] ~= 64 then
  return mp.CLEAN
end
if epcode[10] ~= 15 then
  return mp.CLEAN
end
if epcode[11] ~= 142 then
  return mp.CLEAN
end
if epcode[14] ~= 255 then
  return mp.CLEAN
end
if epcode[15] ~= 255 then
  return mp.CLEAN
end
return mp.INFECTED
