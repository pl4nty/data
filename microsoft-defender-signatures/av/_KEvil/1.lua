-- Threat: \xb0KEvil
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if pehdr.NumberOfSymbols ~= 1279874629 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "`\030\006\015\160\015\168\232\000\000\000\000]\129\237D",
    xray_type = 0,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -3, -1024, -512)
