-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\59d787a1032a\1.luac 

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
local l_0_4 = (MpCommon.GetImagePathFromPid)(l_0_2)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = contains
local l_0_6 = l_0_4
do
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC68: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R5 in 'AssignReg'

  if not l_0_5 then
    return l_0_5
  end
  -- DECOMPILER ERROR at PC75: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC81: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC82: Overwrote pending register: R6 in 'AssignReg'

  if l_0_6 then
    return l_0_6
  end
  -- DECOMPILER ERROR at PC84: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC85: Overwrote pending register: R6 in 'AssignReg'

  do return l_0_6 end
  -- WARNING: undefined locals caused missing assignments!
end

