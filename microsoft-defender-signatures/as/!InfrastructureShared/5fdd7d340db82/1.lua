-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5fdd7d340db82\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC42: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC43: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC44: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC45: Overwrote pending register: R6 in 'AssignReg'

  if ("rdiff-backup_1.2.8.exe")("rclone.exe", "edgewebsync.exe") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC56: Overwrote pending register: R7 in 'AssignReg'

  if (string.find)(l_0_2, "rclone.exe", "rsync.exe", true) then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

