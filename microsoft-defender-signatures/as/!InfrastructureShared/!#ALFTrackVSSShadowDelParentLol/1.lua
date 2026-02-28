local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "VSSAMSI_CallerPID"
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.get_mpattributevalue
L2_1 = "VSSAMSI_ProcessStartTime"
L1_1 = L1_1(L2_1)
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = nil
L4_1 = {}
L4_1["powershell.exe"] = true
L4_1["cmd.exe"] = true
L4_1["wscript.exe"] = true
L4_1["cscript.exe"] = true
L5_1 = {}
L5_1["svchost.exe"] = true
L5_1["agentExecutor.exe"] = true
L5_1["iperius.exe"] = true
L5_1["oxibackupd.exe"] = true
L5_1["obndmpd.exe"] = true
L5_1["cpmagentservice.exe"] = true
L6_1 = string
L6_1 = L6_1.format
L7_1 = "pid:%d,ProcessStart:%u"
L8_1 = L0_1
L9_1 = L1_1
L6_1 = L6_1(L7_1, L8_1, L9_1)
L7_1 = mp
L7_1 = L7_1.GetProcessCommandLine
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L2_1 = L7_1
if L2_1 ~= nil then
  L7_1 = {}
  L8_1 = table
  L8_1 = L8_1.insert
  L9_1 = L7_1
  L10_1 = L6_1
  L8_1(L9_1, L10_1)
  L8_1 = MpCommon
  L8_1 = L8_1.GetPersistContextCountNoPath
  L9_1 = "vssamsipid"
  L8_1 = L8_1(L9_1)
  if 0 < L8_1 then
    L8_1 = MpCommon
    L8_1 = L8_1.OverwritePersistContextNoPath
    L9_1 = "vssamsipid"
    L10_1 = L7_1
    L11_1 = 120
    L8_1(L9_1, L10_1, L11_1)
  else
    L8_1 = MpCommon
    L8_1 = L8_1.SetPersistContextNoPath
    L9_1 = "vssamsipid"
    L10_1 = L7_1
    L11_1 = 120
    L8_1(L9_1, L10_1, L11_1)
  end
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = string
  L9_1 = L9_1.format
  L10_1 = "MpInternal_researchdata=VSSCaller=%s"
  L11_1 = L2_1
  L9_1, L10_1, L11_1, L12_1, L13_1 = L9_1(L10_1, L11_1)
  L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
  L8_1 = mp
  L8_1 = L8_1.GetParentProcInfo
  L9_1 = L6_1
  L8_1 = L8_1(L9_1)
  L3_1 = L8_1
  if L3_1 ~= nil then
    L8_1 = L3_1.image_path
    if L8_1 ~= nil then
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = string
      L9_1 = L9_1.format
      L10_1 = "MpInternal_researchdata=VSSCallerParent=%s"
      L11_1 = L3_1.image_path
      L9_1, L10_1, L11_1, L12_1, L13_1 = L9_1(L10_1, L11_1)
      L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
      L8_1 = string
      L8_1 = L8_1.lower
      L9_1 = L3_1.image_path
      L10_1 = L9_1
      L9_1 = L9_1.match
      L11_1 = "([^\\]+)$"
      L9_1, L10_1, L11_1, L12_1, L13_1 = L9_1(L10_1, L11_1)
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
      if L8_1 ~= nil then
        L9_1 = L4_1[L8_1]
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.GetParentProcInfo
          L10_1 = L3_1.ppid
          L9_1 = L9_1(L10_1)
          if L9_1 ~= nil then
            L10_1 = L9_1.image_path
            if L10_1 ~= nil then
              L10_1 = mp
              L10_1 = L10_1.set_mpattribute
              L11_1 = string
              L11_1 = L11_1.format
              L12_1 = "MpInternal_researchdata=VSSCallerGParent=%s"
              L13_1 = L9_1.image_path
              L11_1, L12_1, L13_1 = L11_1(L12_1, L13_1)
              L10_1(L11_1, L12_1, L13_1)
              L10_1 = string
              L10_1 = L10_1.lower
              L11_1 = L9_1.image_path
              L12_1 = L11_1
              L11_1 = L11_1.match
              L13_1 = "([^\\]+)$"
              L11_1, L12_1, L13_1 = L11_1(L12_1, L13_1)
              L10_1 = L10_1(L11_1, L12_1, L13_1)
              if L10_1 ~= nil then
                L11_1 = L5_1[L10_1]
                if L11_1 then
                  L11_1 = mp
                  L11_1 = L11_1.CLEAN
                  return L11_1
                end
              end
              L11_1 = mp
              L11_1 = L11_1.INFECTED
              return L11_1
            end
          end
        end
      end
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
