-- Threat: \xdc!Horst.V
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 489) ~= 167936 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 517) ~= 3758096480 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 529) ~= 57344 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 557) ~= 3758096480 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(2598, 256)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 256)
if l_0_1 ~= 1367920942 then
  return mp.CLEAN
end
return mp.INFECTED
