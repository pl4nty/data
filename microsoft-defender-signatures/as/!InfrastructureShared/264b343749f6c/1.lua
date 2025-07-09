-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\264b343749f6c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = GetRealPidForScenario(l_0_0.ppid)
local l_0_2 = l_0_0.command_line
local l_0_3 = (bm.get_imagepath)()
local l_0_4 = GetTacticsTableForPid(l_0_1)
local l_0_5 = GetTechniquesTableForPid(l_0_1)
local l_0_6 = GetTacticsTableGlobal()
if l_0_4 == nil or l_0_5 == nil or l_0_6 == nil or type(l_0_4) ~= "table" or type(l_0_5) ~= "table" or type(l_0_6) ~= "table" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_3) then
  return mp.CLEAN
end
isKeyInTable = function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5,l_1_6 in pairs(l_1_1) do
    if l_1_5 == l_1_0 then
      return true
    end
  end
  return false
end

local l_0_7 = {}
for l_0_11,l_0_12 in pairs(l_0_4) do
  if l_0_11 ~= "DefenseEvasion_Masquerading" then
    local l_0_13 = l_0_11:match("([^_]+)_")
    if l_0_13 then
      l_0_13 = (string.lower)(l_0_13)
      if l_0_7[l_0_13] == nil then
        l_0_7[l_0_13] = 1
      else
        l_0_7[l_0_13] = l_0_7[l_0_13] + 1
      end
    end
  end
end
getTacticCount = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_7
  do
    if l_0_7[l_2_0] ~= nil then
      local l_2_1 = l_0_7[l_2_0]
      if l_2_1 ~= nil and l_2_1 ~= "" and l_2_1 > 0 then
        return l_2_1
      end
    end
    return 0
  end
end

-- DECOMPILER ERROR at PC144: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC144: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC144: Unhandled construct in 'MakeBoolean' P3

if (isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) and getTacticCount("persistence") > 0) or not isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) or getTacticCount("persistence") <= 0 or not isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) or isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) and getTacticCount("commandandcontrol") > 0 then
  AddResearchData(l_0_1, true)
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN

