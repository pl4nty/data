-- Threat: \x88!Renos.gen!BB
-- Type: 8

if peattributes.packed ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[5].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[5].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[12].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[12].Size ~= 0 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\\\\.\\SIWVIDSTART\000",
    xray_type = 4,
    bytes_to_decrypt = 0
  },
  {
    sig = "UnhandledExcepti",
    xray_type = 4,
    bytes_to_decrypt = 0
  },
  {
    sig = "ABCDEFGHIJKLMNOP",
    xray_type = 4,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 3, 1, 0, 4096)
