-- Threat: !#MpIsExhaustiveScriptScan
-- Type: 12

if mp.readu_u32(headerpage, 1) ~= 1953651835 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 204800 or 2097152 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if string.find(l_0_1, "generator Riched20 6.3.9600", 1, true) ~= nil and string.find(l_0_1, "ansi\\ansicpg1252\\deff0\\nouicompat\\deflang1033\\deflangfe2052", 1, true) ~= nil and (string.find(l_0_1, "WOW SUCH FAKE MUCH", 1, true) ~= nil or string.find(l_0_1, "Please Wait While", 1, true) ~= nil) then
  return mp.INFECTED
end
if string.find(l_0_1, "panose 02020603050405020304}Times New Roman;}", 1, true) ~= nil and string.find(l_0_1, "rtf1\\adeflang1025\\ansi\\ansicpg125", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
