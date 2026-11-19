-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspicousShellCodeDataFile
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_UNKNOWN_FILE & LUA:FileSizeLE1000.A

local l_0_0 = mp.getfilesize()
if l_0_0 < 256 or 4096 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, 5)
local l_0_2 = tostring(l_0_1)
if string.find(l_0_2, "U\139\236\129\236", 1, true) == nil then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:ShellCodeBinaryFileFound.S001")
local l_0_3 = mp.readfile(0, 256)
local l_0_4 = tostring(l_0_3)
if string.find(l_0_4, "d\1610\000\000\000\139@\f\139@\f\139\000\139\000\139@\024\139\248", 1, true) ~= nil then
  mp.set_mpattribute("Lua:GetKernel32DllBase.S001")
end
if string.find(l_0_4, "\186\2555S\019\139\207\232", 1, true) ~= nil then
  mp.set_mpattribute("Lua:GetReadFileFromHash.S001")
end
if string.find(l_0_4, "\186\003\022\159\156\139\207\232", 1, true) ~= nil then
  mp.set_mpattribute("Lua:GetReadFileFromHash.S001")
end
if string.find(l_0_4, "\186f}vW\139\207\137E", 1, true) ~= nil then
  mp.set_mpattribute("Lua:GetVirtuallFromHash.S001")
end
if string.find(l_0_4, "\186\234]>\n\139\207\137E", 1, true) ~= nil then
  mp.set_mpattribute("Lua:GetVirtuallFromHash.S001")
end
if string.find(l_0_4, "\253\255\255P\255\214j\000h\128\000\000\000j\003j\000j\ah\000\000\000\128\141\133", 1, true) ~= nil then
  mp.set_mpattribute("Lua:SuspicousShellCodeDataFile.S001")
end
if string.find(l_0_4, "P\255\2143\255Wh\128\000\000\000j\003Wj\ah\000\000\000\128\141\133", 1, true) ~= nil then
  mp.set_mpattribute("Lua:SuspicousShellCodeDataFile.S001")
end
if string.find(l_0_4, "\186\003\022\159\156\139\207\232\202\000\000\000\186L\2009n\139\207\137E\212\232\187\000\000\000\186\244\181{\f\139\207\139\240\232\173\000\000\000\186\234]>\n", 1, true) ~= nil then
  mp.set_mpattribute("Lua:APIinMalicious.S001")
end
return mp.CLEAN
