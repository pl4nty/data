-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFBackdoorWin32SuspSingleScriptResourceDSCMo\1_luac 

-- params : ...
-- function num : 0
(mp.readprotection)(false)
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 1048576 then
  return mp.CLEAN
end
local l_0_1 = (mp.readfile)(0, l_0_0)
local l_0_2, l_0_3 = l_0_1:gsub("instance of MSFT_", "")
;
(mp.readprotection)(true)
if l_0_3 == 1 then
  (mp.set_mpattribute)("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN

