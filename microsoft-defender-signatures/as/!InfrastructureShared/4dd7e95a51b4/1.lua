-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4dd7e95a51b4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1.image_path)
if not l_0_2:find("\\explorer.exe") then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_3 or #l_0_3 <= 60 then
  return mp.CLEAN
end
if #l_0_3 > 450 then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
local l_0_4 = "(?:#.*?\\d{3,}\\s*$|<#.*?\\d{3,}\\s*#>|[-;:]{1,3}\\s*[^#<]{0,100}?\\d{3,}\\s*$)"
local l_0_5 = "(rem\\s+.*?\\d{3,}\\s*$|::\\s*.*?\\d{3,}\\s*$)"
local l_0_6 = (MpCommon.GetImagePathFromPid)(l_0_0)
if not l_0_6 then
  return mp.CLEAN
end
l_0_6 = (string.lower)(l_0_6)
local l_0_7 = contains
local l_0_8 = l_0_6
do
  local l_0_9 = {}
  -- DECOMPILER ERROR at PC78: No list found for R9 , SetList fails

  -- DECOMPILER ERROR at PC82: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC83: Overwrote pending register: R7 in 'AssignReg'

  if not l_0_7 then
    return l_0_7
  end
  -- DECOMPILER ERROR at PC85: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC91: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC92: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC93: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC98: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC99: Overwrote pending register: R9 in 'AssignReg'

  if l_0_7 and l_0_7 then
    return l_0_9
  end
  -- DECOMPILER ERROR at PC101: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC102: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC103: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC109: Overwrote pending register: R9 in 'AssignReg'

  if l_0_7 then
    return l_0_9
  end
  -- DECOMPILER ERROR at PC111: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC112: Overwrote pending register: R9 in 'AssignReg'

  do return l_0_9 end
  -- WARNING: undefined locals caused missing assignments!
end

