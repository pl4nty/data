-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3b75d989c\0x00000f65_luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.PathToWin32Path)((bm.get_imagepath)())
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = {}
-- DECOMPILER ERROR at PC19: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC20: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC21: Overwrote pending register: R3 in 'AssignReg'

if ("\\gsl\\filesync\\rclone.exe")("schoolsdataarchive\\rclone.exe", l_0_1) then
  return mp.CLEAN
end
reportSessionInformation()
return mp.INFECTED

