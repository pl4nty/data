-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1d7d7f2b2e71c\0x0000ba04_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:lower()
if (string.find)(l_0_2, "wscript.exe", 1, true) and (string.find)(l_0_2, ".js", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

