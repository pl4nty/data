-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\37ad72207e519\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if #l_0_3 < 50 then
  return mp.CLEAN
end
if #l_0_3 > 450 then
  return mp.CLEAN
end
local l_0_4 = (MpCommon.GetImagePathFromPid)(l_0_2)
if not l_0_4 then
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_4)
local l_0_5 = contains
local l_0_6 = l_0_4
do
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC79: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC83: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: Overwrote pending register: R5 in 'AssignReg'

  if not l_0_5 then
    return l_0_5
  end
  -- DECOMPILER ERROR at PC86: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC89: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC95: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC96: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC97: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC98: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC102: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC103: Overwrote pending register: R7 in 'AssignReg'

  if l_0_5 and l_0_5 then
    return l_0_7
  end
  -- DECOMPILER ERROR at PC106: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC107: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC112: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC113: Overwrote pending register: R5 in 'AssignReg'

  if l_0_5 then
    return l_0_5
  end
  -- DECOMPILER ERROR at PC115: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R5 in 'AssignReg'

  do return l_0_5 end
  -- WARNING: undefined locals caused missing assignments!
end

