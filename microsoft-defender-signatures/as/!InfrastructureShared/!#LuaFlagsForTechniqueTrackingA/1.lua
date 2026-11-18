-- Threat: !InfrastructureShared
-- Name: !#Lua:FlagsForTechniqueTracking.A
-- Type: 13
-- Includes: TechniqueTracker

local l_0_0
local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_1 and l_0_2 ~= nil then
  l_0_0 = l_0_2
else
  l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = GetRealPidForScenario(l_0_0)
if l_0_0 ~= nil then
  if IsPidExcluded(l_0_0) or mp.get_mpattribute("AGGR:TTExclusion") or mp.get_mpattribute("SCRIPT:TTExclusion") or mp.get_mpattribute("Lua:TTExclusion") then
    mp.set_mpattribute("Lua:TT:TTExclusion")
    mp.set_mpattribute("Lua:TT:DetectionThresholdNotMet")
  else
    local l_0_3, l_0_4 = GetDetectionThresholdMetReason(l_0_0)
    if l_0_3 then
      mp.set_mpattribute("Lua:TT:DetectionThresholdMet")
      if mp.bitand(l_0_4, 1) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!TaintedMachine")
      end
      if mp.bitand(l_0_4, 2) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!InjectionHollow")
      end
      if mp.bitand(l_0_4, 4) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!InjectKeylog")
      end
      if mp.bitand(l_0_4, 8) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!IndirectCmd")
      end
      if mp.bitand(l_0_4, 16) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!InjectDiscovery")
      end
      if mp.bitand(l_0_4, 32) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!CredDiscovery")
      end
      if mp.bitand(l_0_4, 64) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!RemoteService")
      end
      if mp.bitand(l_0_4, 128) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!Masquerading")
      end
      if mp.bitand(l_0_4, 256) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!SoftwarePacking")
      end
      if mp.bitand(l_0_4, 512) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!ThresholdCount")
      end
      if mp.bitand(l_0_4, 1024) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!CommandControl")
      end
      if mp.bitand(l_0_4, 2048) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!Malware")
      end
      if mp.bitand(l_0_4, 4096) ~= 0 then
        mp.set_mpattribute("Lua:TT:Reason!TaintedMachineML")
      end
    else
      if mp.bitand(l_0_4, 2147483648) ~= 0 then
        mp.set_mpattribute("Lua:TT:TTExclusion")
      end
      mp.set_mpattribute("Lua:TT:DetectionThresholdNotMet")
    end
  end
  local l_0_5 = GetTaintLevelHR()
  if l_0_5 ~= nil then
    if l_0_5 == "Medium" or l_0_5 == "High" then
      mp.set_mpattribute("Lua:TT:IsTaintedMachine")
    end
    mp.set_mpattribute("Lua:TT:TaintValue!" .. l_0_5)
  end
  local l_0_6 = GetTaintLevelML()
  if l_0_6 ~= nil then
    mp.set_mpattribute("Lua:TT:TaintValueML!" .. l_0_6)
  end
end
return mp.INFECTED
