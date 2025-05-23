-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!KloshagD!dha\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetLnkInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.Arguments
if l_0_1 == nil then
  return mp.CLEAN
end
if #l_0_1 < 200 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (string.match)(l_0_1, "%s%s%s%s%s%s%s")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = false
if (string.find)(l_0_1, "manualfiit", 1, true) or (string.find)(l_0_1, "utemanswapsldnprod", 1, true) or (string.find)(l_0_1, "manualswaps", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "forgerock", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\qbittorrent\\", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\proframe\\", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "echo    ", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "npssconsortium", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\rdclientwpf\\", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, ".rdp", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "\\ureg.dll", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "--load-extension", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "--allow-insecure-localhost", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "invoke-webrequest", 1, true) then
  (mp.set_mpattribute)("Lua:LNKWithLongWhiteSpacesBadArg")
  return mp.INFECTED
end
local l_0_4 = l_0_0.IDLISTTarget
if l_0_4 == nil then
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_4)
if (string.find)(l_0_4, "cmd.exe", 1, true) then
  l_0_3 = true
end
if (string.find)(l_0_4, "regsvr32.exe", 1, true) then
  l_0_3 = true
end
if (string.find)(l_0_4, "conhost.exe", 1, true) then
  l_0_3 = true
end
if (string.find)(l_0_4, "ssh.exe", 1, true) then
  l_0_3 = true
end
if (string.find)(l_0_4, "wscript.exe", 1, true) then
  l_0_3 = true
end
if (string.find)(l_0_4, "rundll32.exe", 1, true) then
  l_0_3 = true
end
if l_0_3 then
  (mp.set_mpattribute)("Lua:LNKWithLongWhiteSpaces")
  return mp.INFECTED
end
return mp.CLEAN

