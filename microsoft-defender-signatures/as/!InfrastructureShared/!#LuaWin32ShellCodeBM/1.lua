-- Threat: !InfrastructureShared
-- Name: !#Lua:Win32/ShellCode.BM
-- Type: 13
-- Includes: ConversionToBinary_fastHex2Bin
-- MpAttributes: SCPT:Exploit:Win32/ShellCode.BM

local l_0_0 = mp.getfilesize()
if 102400 < l_0_0 then
  return mp.CLEAN
end
local l_0_1
if l_0_0 <= mp.HEADERPAGE_SZ then
  l_0_1 = tostring(headerpage)
else
  mp.readprotection(false)
  l_0_1 = tostring(mp.readfile(0, l_0_0))
end
local l_0_2 = string.gmatch(l_0_1, "var_shellcode%s*=%s*\"(4d5a%x+)\"")
local l_0_3 = 0
for l_0_4 in l_0_2, nil, nil do
  if l_0_4 ~= nil and l_0_4 ~= "" then
    mp.vfo_add_buffer(fastHex2Bin(l_0_4, "[0-9A-Fa-f][0-9A-Fa-f]"), string.format("[Hexify][%02X]", l_0_3), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    l_0_3 = l_0_3 + 1
  end
end
if 0 < l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
