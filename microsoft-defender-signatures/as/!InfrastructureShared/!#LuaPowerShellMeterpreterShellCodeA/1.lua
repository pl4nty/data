-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell/MeterpreterShellCode.A
-- Type: 13
-- Includes: ConversionToBinary_fastHex2Bin
-- MpAttributes: SCPT:PSByteShellcode

local l_0_0 = 0
if mp.get_mpattribute("SCPT:PSDllImportKernel32") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:PSImportVirtualAlloc") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:PSImportCreateThread") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:PSCallWindowsAPI") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:PowerShell/InteropServicesCopy") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:PowerShell/VirtualAlloc") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:PowerShell/CreateThread") then
  l_0_0 = l_0_0 + 1
end
if l_0_0 < 2 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if 1536000 < l_0_1 then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:PowerShell/MeterpreterShellCode.A!st")
local l_0_2
if l_0_1 <= 4096 then
  l_0_2 = tostring(headerpage)
else
  mp.readprotection(false)
  l_0_2 = tostring(mp.readfile(0, l_0_1))
end
if l_0_2 == nil or l_0_2:len() < 12 then
  return mp.CLEAN
end
local l_0_3 = string.gmatch(l_0_2, "%[[bB]yte%[%]%].-=.-(0x.-)[\r\n;]")
local l_0_4 = 0
for l_0_5 in l_0_3, nil, nil do
  if l_0_5 ~= nil and string.len(l_0_5) > 5 and string.find(l_0_5, "0x", 1, true) ~= nil and string.find(l_0_5, ",", 1, true) ~= nil then
    local l_0_6 = l_0_5
    if l_0_6:sub(-1) == ")" then
      l_0_6 = l_0_6:sub(0, -3)
    end
    l_0_6 = (l_0_6 .. ","):gsub("0x([0-9A-Fa-f]+),", "0x0%1,")
    l_0_6 = string.gsub(l_0_6, "%s+", "")
    local l_0_7 = fastHex2Bin(l_0_6, "0X[0-9A-Fa-f]-([0-9A-Fa-f][0-9A-Fa-f]),")
    mp.vfo_add_buffer(l_0_7, string.format("[PSByteShellcode_%02X]", l_0_4), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    if l_0_5:sub(0, 2) ~= "MZ" and #l_0_7 <= 8192 then
      local l_0_8 = "4D5A9000000000000000000050450000" .. "4C010100000000000000000000000000" .. "78000F000B0100000000000000000000" .. "00000000D0000000000000000C000000" .. "00004000000100000001000004000000" .. "01000000040000000000000000300000" .. "C5000000000000000300000000000000" .. "00000000000000000000000000000000" .. "00000000000000000000000000000000" .. "0000000000000000000000002E746578" .. "7400000000200000D000000000200000" .. "D0000000000000000000000000000000" .. "400030E0000000000000000000000000"
      mp.vfo_add_buffer(fastHex2Bin(l_0_8, "[0-9A-Fa-f][0-9A-Fa-f]") .. l_0_7, string.format("[PSByteShellcodeInPE_%02X]", l_0_4), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      local l_0_9 = "4D5ACEFA504500006486000000000000" .. "000000000000000000002F000B02FAFA" .. "00000000000000000000000008010000" .. "00000000000000000100000004000000" .. "04000000CAFEBABECAFEBABE05000000" .. "00000000000400000801000000000000" .. "02000000CAFEBABE00000000CAFEBABE" .. "00000000CAFEBABE00000000CAFEBABE" .. "00000000000000000000000000000000" .. "00000000000000000000000000000000" .. "00000000000000000000000000000000" .. "00000000000000000000000000000000" .. "00000000000000000000000000000000" .. "00000000000000000000000000000000" .. "00000000000000000000000000000000" .. "00000000000000000000000000000000" .. "0000000000000000"
      mp.vfo_add_buffer(fastHex2Bin(l_0_9, "[0-9A-Fa-f][0-9A-Fa-f]") .. l_0_7, string.format("[PSByteShellcodeInPE64_%02X]", l_0_4), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    end
    l_0_4 = l_0_4 + 1
  end
end
if 0 < l_0_4 then
  return mp.INFECTED
end
mp.set_mpattribute("Lua:PowerShell/MeterpreterShellCode.A!noshell")
return mp.CLEAN
