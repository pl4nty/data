-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/SimToolFileOperation.A
-- Type: 12
-- Includes: TechniqueTracker, BasScenarioSpecificInfra
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_0 == nil or #l_0_0 <= 3 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT)
local l_0_2 = false
local l_0_3 = GetTacticsCountForPid(l_0_0)
if l_0_3 ~= nil and 0 < l_0_3 and (IsTacticObservedForPid(l_0_0, "simtool_childproc") or IsTacticObservedForParents(l_0_0, "simtool_childproc", 3)) then
  if l_0_1 == true then
    mp.set_mpattribute("Lua:Context/SimToolCreatedFile.A")
  end
  l_0_2 = true
end
local l_0_4 = IsBasToolProcessForPpid(l_0_0)
local l_0_5 = IsBasToolProcessFoundInParents(l_0_0, "Any", 4)
if l_0_4 == true or l_0_5 == true then
  l_0_2 = true
  if l_0_4 == true then
    if l_0_1 == true then
      mp.set_mpattribute("Lua:Context/BasToolProcCreatedFile.A")
      mp.set_mpattribute("Lua:Context/BasToolProcTreeCreatedFile.A")
    end
    mp.set_mpattribute("Lua:ContextDataProcess/BasToolProcess.A")
    mp.set_mpattribute("Lua:ContextDataProcess/BasToolProcessTree.A")
  elseif l_0_5 == true then
    if l_0_1 == true then
      mp.set_mpattribute("Lua:Context/BasToolProcTreeCreatedFile.A")
    end
    mp.set_mpattribute("Lua:ContextDataProcess/BasToolProcessTree.A")
  end
  if IsBasToolProcessForPpid(l_0_0, "SafeBreach") then
    if l_0_1 == true then
      mp.set_mpattribute("Lua:Context/SafeBreachProcCreatedFile.A")
    end
    mp.set_mpattribute("Lua:ContextDataProcess/SafeBreachProcess.A")
  end
  if IsBasToolProcessForPpid(l_0_0, "AttackIQ") then
    if l_0_1 == true then
      mp.set_mpattribute("Lua:Context/AttackIQProcCreatedFile.A")
    end
    mp.set_mpattribute("Lua:ContextDataProcess/AttackIQProcess.A")
  end
  if IsBasToolProcessForPpid(l_0_0, "Picus") then
    if l_0_1 == true then
      mp.set_mpattribute("Lua:Context/PicusProcCreatedFile.A")
      mp.set_mpattribute("Lua:Context/PicusProcTreeCreatedFile.A")
    end
    mp.set_mpattribute("Lua:ContextDataProcess/PicusProcess.A")
    mp.set_mpattribute("Lua:ContextDataProcess/PicusProcessTree.A")
  elseif IsBasToolProcessFoundInParents(l_0_0, "Picus", 4) then
    if l_0_1 == true then
      mp.set_mpattribute("Lua:Context/PicusProcTreeCreatedFile.A")
    end
    mp.set_mpattribute("Lua:ContextDataProcess/PicusProcessTree.A")
  end
end
if l_0_2 == true then
  return mp.INFECTED
end
return mp.CLEAN
