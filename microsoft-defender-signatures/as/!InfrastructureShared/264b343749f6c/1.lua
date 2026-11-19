-- Threat: !InfrastructureShared
-- Name: 264b343749f6c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = GetRealPidForScenario(l_0_0.ppid)
local l_0_2 = l_0_0.command_line
local l_0_3 = bm.get_imagepath()
local l_0_4 = GetTacticsTableForPid(l_0_1)
local l_0_5 = GetTechniquesTableForPid(l_0_1)
local l_0_6 = GetTacticsTableGlobal()
if l_0_4 == nil or l_0_5 == nil or l_0_6 == nil or type(l_0_4) ~= "table" or type(l_0_5) ~= "table" or type(l_0_6) ~= "table" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_3) then
  return mp.CLEAN
end

function isKeyInTable(l_1_0, l_1_1)
  for l_1_2, l_1_3 in pairs(l_1_1) do
    if l_1_2 == l_1_0 then
      return true
    end
  end
  return false
end

local l_0_7 = {}
for l_0_8, l_0_9 in pairs(l_0_4) do
  if l_0_8 ~= "DefenseEvasion_Masquerading" then
    local l_0_10 = l_0_8:match("([^_]+)_")
    if l_0_10 then
      l_0_10 = string.lower(l_0_10)
      if l_0_7[l_0_10] == nil then
        l_0_7[l_0_10] = 1
      else
        l_0_7[l_0_10] = l_0_7[l_0_10] + 1
      end
    end
  end
end

function getTacticCount(l_2_0)
  if l_0_7[l_2_0] ~= nil then
    local l_2_1 = l_0_7[l_2_0]
    if l_2_1 ~= nil and l_2_1 ~= "" and 0 < l_2_1 then
      return l_2_1
    end
  end
  return 0
end

if isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) and getTacticCount("persistence") > 0 or isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) and getTacticCount("discovery") > 3 or getTacticCount("persistence") > 0 and getTacticCount("discovery") > 2 or isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) and 0 < getTacticCount("defenseevasion") or isKeyInTable("Execution_UserExecution_UnsignedAdhocFile", l_0_4) and 0 < getTacticCount("commandandcontrol") then
  AddResearchData(l_0_1, true)
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
