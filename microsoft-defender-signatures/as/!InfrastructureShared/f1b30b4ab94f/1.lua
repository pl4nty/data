local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
else
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "rundll32.exe"
L5_1 = "regsvr32.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "targetprocessppid:(%d+):(%d+)"
L1_1, L2_1 = L1_1(L2_1, L3_1)
if not L1_1 or not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "pid:"
L4_1 = L1_1
L5_1 = ",ProcessStart:"
L6_1 = L2_1
L3_1 = L3_1 .. L4_1 .. L5_1 .. L6_1
L4_1 = sysio
L4_1 = L4_1.GetFileNameFromProcess
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L5_1 = contains
  L6_1 = L4_1
  L7_1 = "\\windows\\syswow64"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = contains
    L6_1 = L4_1
    L7_1 = {}
    L8_1 = "svchost.exe"
    L7_1[1] = L8_1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = bm
    L5_1 = L5_1.add_related_string
    L6_1 = "Injected_imagepath"
    L7_1 = L4_1
    L8_1 = bm
    L8_1 = L8_1.RelatedStringBMReport
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = triggerMemoryScanOnProcessTree
    L6_1 = true
    L7_1 = true
    L8_1 = "SMS_M"
    L9_1 = 100
    L10_1 = "Behavior:Win32/DllInject.SE"
    L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
