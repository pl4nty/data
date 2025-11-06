-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextSimToolAmsiScanA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil or #l_0_0 <= 3 then
  return mp.CLEAN
end
local l_0_1 = false
local l_0_2 = GetTacticsCountForPid(l_0_0)
if l_0_2 ~= nil and l_0_2 > 0 then
  if (IsTacticObservedForPid(l_0_0, "simtool_childproc") or IsTacticObservedForParents(l_0_0, "simtool_childproc", 3)) and (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
    (mp.set_mpattribute)("Lua:Context/SimToolPowerShellAMSIScan.A")
  end
  l_0_1 = true
end
local l_0_3 = IsBasToolProcessForPpid(l_0_0)
local l_0_4 = IsBasToolProcessFoundInParents(l_0_0, "Any", 4)
local l_0_5 = (mp.get_mpattribute)("MpIsPowerShellAMSIScan")
if l_0_3 == true or l_0_4 == true then
  l_0_1 = true
  if l_0_3 == true then
    (mp.set_mpattribute)("Lua:Context/BasToolAmsiProcess.A")
  end
  ;
  (mp.set_mpattribute)("Lua:Context/BasToolAmsiProcessTree.A")
  if l_0_5 == true then
    if l_0_3 == true then
      (mp.set_mpattribute)("Lua:Context/BasToolPowershellAmsiProcess.A")
    end
    ;
    (mp.set_mpattribute)("Lua:Context/BasToolPowershellAmsiProcessTree.A")
  end
  if IsBasToolProcessForPpid(l_0_0, "Picus") then
    (mp.set_mpattribute)("Lua:Context/PicusAmsiProcess.A")
    ;
    (mp.set_mpattribute)("Lua:Context/PicusAmsiProcessTree.A")
    if l_0_5 == true then
      (mp.set_mpattribute)("Lua:Context/PicusPowershellAmsiProcess.A")
      ;
      (mp.set_mpattribute)("Lua:Context/PicusPowershellAmsiProcessTree.A")
    end
  else
    if IsBasToolProcessFoundInParents(l_0_0, "Picus", 4) then
      (mp.set_mpattribute)("Lua:Context/PicusAmsiProcessTree.A")
      if l_0_5 == true then
        (mp.set_mpattribute)("Lua:Context/PicusPowershellAmsiProcessTree.A")
      end
    end
  end
end
if l_0_1 == true then
  return mp.INFECTED
end
return mp.CLEAN

