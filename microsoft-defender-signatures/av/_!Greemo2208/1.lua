-- Threat: \xb0!Greemo.2208
-- Type: 8

if pehdr.PointerToSymbolTable ~= 1229739332 then
  return mp.CLEAN
end
if peattributes.lastscn_eqsizes == false then
  return mp.CLEAN
end
if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData < 2048 then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "`j Zd\139\002\133\192t\bj\255Xd\137\002\139\224\232\006\000\000\000\139d$\b\235\0253\210d\2552d\137\"\244\255\226",
    xray_type = 0,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, -2816, -2304)
