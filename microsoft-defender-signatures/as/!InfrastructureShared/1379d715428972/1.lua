-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1379d715428972\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1.image_path)
if l_0_2:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_3 = (mp.GetScannedPPID)()
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = (mp.GetProcessCommandLine)(l_0_3)
if not l_0_4 or #l_0_4 <= 60 then
  return mp.CLEAN
end
if #l_0_4 > 450 then
  return mp.CLEAN
end
local l_0_5 = (MpCommon.GetImagePathFromPid)(l_0_3)
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = (string.lower)(l_0_5)
local l_0_6 = contains
local l_0_7 = l_0_5
do
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC75: No list found for R8 , SetList fails

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R6 in 'AssignReg'

  if not l_0_6 then
    return l_0_6
  end
  -- DECOMPILER ERROR at PC82: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC88: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC89: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC95: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC96: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC98: Overwrote pending register: R0 in 'AssignReg'

  -- DECOMPILER ERROR at PC99: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC100: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R6 in 'AssignReg'

  if not l_0_6 or l_0_6 then
    return l_0_6
  end
  -- DECOMPILER ERROR at PC107: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC109: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC110: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC111: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC113: Overwrote pending register: R0 in 'AssignReg'

  -- DECOMPILER ERROR at PC114: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC115: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC118: Overwrote pending register: R0 in 'AssignReg'

  -- DECOMPILER ERROR at PC119: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC120: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC122: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC127: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC128: Overwrote pending register: R8 in 'AssignReg'

  if not l_0_8 then
    return l_0_8
  end
  -- DECOMPILER ERROR at PC130: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC131: Overwrote pending register: R8 in 'AssignReg'

  do return l_0_8 end
  -- WARNING: undefined locals caused missing assignments!
end

