-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!DGateSD\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetLnkInfo)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if not l_0_0.BasePath or not contains(l_0_0.BasePath, "cmd.exe") then
  return mp.CLEAN
end
do
  local l_0_1 = l_0_0.Arguments or nil
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_2 = l_0_1:lower()
  local l_0_3, l_0_4 = l_0_2:gsub("||", "")
  local l_0_5, l_0_6 = l_0_2:gsub("&", "")
  if l_0_4 > 2 and l_0_6 > 2 then
    local l_0_7 = contains
    local l_0_8 = l_0_2
    local l_0_9 = {}
    -- DECOMPILER ERROR at PC52: No list found for R8 , SetList fails

    -- DECOMPILER ERROR at PC57: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC58: Overwrote pending register: R6 in 'AssignReg'

    if not l_0_7 then
      return l_0_7
    end
    -- DECOMPILER ERROR at PC60: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC64: Overwrote pending register: R10 in 'AssignReg'

    l_0_7, l_0_9 = l_0_7(l_0_8, l_0_9, false), {"c\"?s\"?c\"?r\"?i\"?p\"?t\"?", "e\"?c\"?h\"?o\"?", "r\"?u\"?n\"?d\"?l\"?l\"?3\"?2\"?"}
    if not l_0_7 then
      l_0_7 = mp
      l_0_7 = l_0_7.CLEAN
      return l_0_7
    end
    l_0_7 = contains
    -- DECOMPILER ERROR at PC75: Overwrote pending register: R7 in 'AssignReg'

    l_0_9 = "c\"?u\"?r\"?l\"?%.?e?\"?x?\"?e?\"?%s+.*h\"?t\"?t\"?p\"?s?\"?"
    l_0_7 = l_0_7(l_0_8, l_0_9, false)
    if l_0_7 then
      l_0_7 = mp
      l_0_7 = l_0_7.INFECTED
      return l_0_7
    end
  end
  do
    return mp.CLEAN
  end
end

