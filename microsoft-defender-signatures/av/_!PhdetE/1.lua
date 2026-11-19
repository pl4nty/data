-- Threat: \xac!Phdet.E
-- Type: 8

if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].Characteristics ~= 3758096416 then
  return mp.CLEAN
end
if mp.bitand(epcode[1], 64) == 64 then
  return mp.CLEAN
end
if mp.bitand(epcode[1], 184) ~= 184 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if peattributes.firstsectwritable ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections <= 2 then
  return mp.CLEAN
end
if pehdr.NumberOfSections >= 5 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "ess\000kernel32.dll\000VirtualFree\000U\137\229`\139U\b\133\210t\\\003U\fR\139z\016\1392\133\255tN\133\246u\002\137\254\139M\f\001\206\001\207\139B\f\001\200\1288\000u\003@\235\248P",
    xray_type = 3,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, 0, 512, 768)
