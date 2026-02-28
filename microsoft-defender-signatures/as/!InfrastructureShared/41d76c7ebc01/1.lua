local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.image_path
  if L1_1 then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = {}
L2_1 = "werfault.exe"
L3_1 = "svchost.exe"
L4_1 = "WerFaultSecure.exe"
L5_1 = "wermgr.exe"
L6_1 = "NisSrv.exe"
L7_1 = "te.processhost.exe"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
if L0_1 then
  L2_1 = L0_1.image_path
  if L2_1 then
    L2_1 = Contains_any_caseinsenstive
    L3_1 = L0_1.image_path
    L4_1 = L1_1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "/pid%s+(%d+)"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\WinDefend"
L7_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Sense"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = ipairs
L7_1 = L5_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L11_1 = sysio
  L11_1 = L11_1.RegOpenKey
  L12_1 = L10_1
  L11_1 = L11_1(L12_1)
  if L11_1 then
    L12_1 = sysio
    L12_1 = L12_1.GetRegValueAsString
    L13_1 = L11_1
    L14_1 = "ImagePath"
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 then
      L14_1 = L12_1
      L13_1 = L12_1.gsub
      L15_1 = "\""
      L16_1 = ""
      L13_1 = L13_1(L14_1, L15_1, L16_1)
      L12_1 = L13_1
      L14_1 = L12_1
      L13_1 = L12_1.gsub
      L15_1 = "'"
      L16_1 = ""
      L13_1 = L13_1(L14_1, L15_1, L16_1)
      L12_1 = L13_1
      L13_1 = mp
      L13_1 = L13_1.ContextualExpandEnvironmentVariables
      L14_1 = L12_1
      L13_1 = L13_1(L14_1)
      L12_1 = L13_1 or L12_1
      if not L13_1 then
      end
      L13_1 = sysio
      L13_1 = L13_1.GetProcessFromFileName
      L14_1 = L12_1
      L13_1 = L13_1(L14_1)
      if L13_1 then
        L14_1 = #L13_1
        if 0 < L14_1 then
          L14_1 = pairs
          L15_1 = L13_1
          L14_1, L15_1, L16_1 = L14_1(L15_1)
          for L17_1, L18_1 in L14_1, L15_1, L16_1 do
            L19_1 = L18_1.pid
            if L19_1 then
              L19_1 = tostring
              L20_1 = L18_1.pid
              L19_1 = L19_1(L20_1)
              if L19_1 == L4_1 then
                L19_1 = L18_1.pid
                L20_1 = "->"
                L21_1 = L12_1
                L22_1 = "->"
                L23_1 = L3_1
                L19_1 = L19_1 .. L20_1 .. L21_1 .. L22_1 .. L23_1
                L20_1 = set_research_data
                L21_1 = "AffectedService"
                L22_1 = MpCommon
                L22_1 = L22_1.Base64Encode
                L23_1 = L19_1
                L22_1 = L22_1(L23_1)
                L23_1 = false
                L20_1(L21_1, L22_1, L23_1)
                if L0_1 then
                  L20_1 = L0_1.ppid
                  if L20_1 then
                    L20_1 = MpCommon
                    L20_1 = L20_1.BmTriggerSig
                    L21_1 = L0_1.ppid
                    L22_1 = "SuspWerFaultSec_CMD"
                    L23_1 = L19_1
                    L20_1(L21_1, L22_1, L23_1)
                  end
                end
                L20_1 = mp
                L20_1 = L20_1.INFECTED
                return L20_1
              end
            end
          end
        end
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
