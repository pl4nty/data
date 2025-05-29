-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6dd761c9f3bb\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if not l_0_1:find("\\explorer.exe") then
  return mp.CLEAN
end
local l_0_2 = (mp.GetScannedPPID)()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = ((mp.GetProcessCommandLine)(l_0_2)):lower()
if not isIEXfound(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = "downloadstring[\\\'\\\"\\(\\s]+https?:\\/\\/\\d+.\\d+.\\d+.\\d+\\/\\w+[\\\'\\\"\\)\\s]+"
if (MpCommon.StringRegExpSearch)(l_0_4, l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN

