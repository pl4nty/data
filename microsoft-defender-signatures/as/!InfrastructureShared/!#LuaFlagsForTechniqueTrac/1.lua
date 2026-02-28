local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = pcall
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L1_1 and L2_1 ~= nil then
  L0_1 = L2_1
else
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_PROCESS_PPID
  L3_1 = L3_1(L4_1)
  L0_1 = L3_1
end
if L0_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = GetRealPidForScenario
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L0_1 = L3_1
if L0_1 ~= nil then
  L3_1 = IsPidExcluded
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.get_mpattribute
    L4_1 = "AGGR:TTExclusion"
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = mp
      L3_1 = L3_1.get_mpattribute
      L4_1 = "SCRIPT:TTExclusion"
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L3_1 = mp
        L3_1 = L3_1.get_mpattribute
        L4_1 = "Lua:TTExclusion"
        L3_1 = L3_1(L4_1)
        if not L3_1 then
          goto lbl_62
        end
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:TT:TTExclusion"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:TT:DetectionThresholdNotMet"
  L3_1(L4_1)
  goto lbl_230
  ::lbl_62::
  L3_1 = GetDetectionThresholdMetReason
  L4_1 = L0_1
  L3_1, L4_1 = L3_1(L4_1)
  if L3_1 then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Lua:TT:DetectionThresholdMet"
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!TaintedMachine"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 2
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!InjectionHollow"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 4
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!InjectKeylog"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 8
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!IndirectCmd"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 16
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!InjectDiscovery"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 32
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!CredDiscovery"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 64
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!RemoteService"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 128
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!Masquerading"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 256
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!SoftwarePacking"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 512
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!ThresholdCount"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 1024
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!CommandControl"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 2048
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!Malware"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 4096
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:Reason!TaintedMachineML"
      L5_1(L6_1)
    end
  else
    L5_1 = mp
    L5_1 = L5_1.bitand
    L6_1 = L4_1
    L7_1 = 2147483648
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= 0 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:TT:TTExclusion"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Lua:TT:DetectionThresholdNotMet"
    L5_1(L6_1)
  end
  ::lbl_230::
  L3_1 = GetTaintLevelHR
  L3_1 = L3_1()
  if L3_1 ~= nil then
    if L3_1 == "Medium" or L3_1 == "High" then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:TT:IsTaintedMachine"
      L4_1(L5_1)
    end
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:TT:TaintValue!"
    L6_1 = L3_1
    L5_1 = L5_1 .. L6_1
    L4_1(L5_1)
  end
  L4_1 = GetTaintLevelML
  L4_1 = L4_1()
  if L4_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Lua:TT:TaintValueML!"
    L7_1 = L4_1
    L6_1 = L6_1 .. L7_1
    L5_1(L6_1)
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
