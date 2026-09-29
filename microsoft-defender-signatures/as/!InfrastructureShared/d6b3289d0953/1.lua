-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b3289d0953\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line or "")
if l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = ""
local l_0_3 = (mp.GetParentProcInfo)()
if l_0_3 and l_0_3.image_path then
  l_0_2 = (string.lower)(l_0_3.image_path)
end
local l_0_4 = contains
local l_0_5 = l_0_2
local l_0_6 = {}
-- DECOMPILER ERROR at PC45: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC49: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC50: Overwrote pending register: R4 in 'AssignReg'

if l_0_4 then
  return l_0_4
end
-- DECOMPILER ERROR at PC52: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC55: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC56: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R9 in 'AssignReg'

l_0_4, l_0_6 = l_0_4(l_0_5, l_0_6), {"agentexecutor.exe", "\\code.exe", "windowsterminal.exe"}
if not l_0_4 then
  l_0_4 = contains
  -- DECOMPILER ERROR at PC63: Overwrote pending register: R5 in 'AssignReg'

  l_0_4, l_0_6 = l_0_4(l_0_5, l_0_6), {"\\escan\\", "\\.vscode\\extensions\\"}
end
if l_0_4 then
  l_0_4 = mp
  l_0_4 = l_0_4.CLEAN
  return l_0_4
end
l_0_4 = contains
-- DECOMPILER ERROR at PC75: Overwrote pending register: R5 in 'AssignReg'

l_0_4, l_0_6 = l_0_4(l_0_5, l_0_6), {"169.254.169.254", "metadata.google", "metadata.azure"}
if l_0_4 then
  l_0_4 = mp
  l_0_4 = l_0_4.CLEAN
  return l_0_4
end
l_0_4 = function(l_1_0)
  -- function num : 0_0
  for l_1_4 = 2, #l_1_0 do
    local l_1_5 = (string.lower)(l_1_0[l_1_4])
    if StringEndsWith(l_1_5, ".ps1") then
      return nil
    end
    local l_1_6 = (string.match)(l_1_5, "^[-/](%a+)$")
    if l_1_6 then
      if (string.sub)("file", 1, #l_1_6) == l_1_6 then
        return l_1_0[l_1_4 + 1]
      end
      if l_1_6 == "ec" or l_1_6 == "cwa" or (string.sub)("command", 1, #l_1_6) == l_1_6 or (string.sub)("encodedcommand", 1, #l_1_6) == l_1_6 or (string.sub)("commandwithargs", 1, #l_1_6) == l_1_6 then
        return nil
      end
    end
  end
  return nil
end

-- DECOMPILER ERROR at PC88: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC89: Overwrote pending register: R5 in 'AssignReg'

l_0_6 = l_0_1
l_0_5 = l_0_5(l_0_6)
if l_0_5 then
  l_0_6 = next
  l_0_6 = l_0_6(l_0_5)
end
if not l_0_6 then
  l_0_6 = mp
  l_0_6 = l_0_6.CLEAN
  return l_0_6
end
l_0_6 = l_0_4
l_0_6 = l_0_6(l_0_5)
if not l_0_6 then
  return mp.CLEAN
end
l_0_6 = normalize_path(l_0_6)
if l_0_6 and StringEndsWith(l_0_6, ".ps1") then
  local l_0_7 = contains
  local l_0_8 = l_0_6
  local l_0_9 = {}
  -- DECOMPILER ERROR at PC127: No list found for R9 , SetList fails

end
-- DECOMPILER ERROR at PC131: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC132: Overwrote pending register: R7 in 'AssignReg'

if not l_0_7 then
  return l_0_7
end
-- DECOMPILER ERROR at PC134: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC135: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC138: Overwrote pending register: R10 in 'AssignReg'

l_0_7(l_0_8, l_0_9, ("\\appdata\\").RelatedStringBMReport)
-- DECOMPILER ERROR at PC141: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC142: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC143: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC144: Overwrote pending register: R11 in 'AssignReg'

l_0_7(l_0_8, l_0_9, nil, "\\programdata\\")
-- DECOMPILER ERROR at PC146: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC149: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC150: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC151: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC152: Overwrote pending register: R9 in 'AssignReg'

if l_0_7 then
  l_0_7(l_0_8, l_0_9)
  -- DECOMPILER ERROR at PC154: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC155: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC156: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC157: Overwrote pending register: R9 in 'AssignReg'

  l_0_7(l_0_8, l_0_9)
end
-- DECOMPILER ERROR at PC159: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC160: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC161: Overwrote pending register: R9 in 'AssignReg'

l_0_7(l_0_8, l_0_9, "SMS_H", 5000, "Behavior:Win32/AmsiFailUserPathPs1.AM")
-- DECOMPILER ERROR at PC166: Overwrote pending register: R7 in 'AssignReg'

l_0_7()
-- DECOMPILER ERROR at PC168: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC169: Overwrote pending register: R7 in 'AssignReg'

return l_0_7

