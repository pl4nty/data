local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = {}
L1_1 = "chrome.exe"
L2_1 = "msedge.exe"
L3_1 = "brave.exe"
L4_1 = "firefox.exe"
L5_1 = "opera.exe"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1.image_path
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L3_1
L4_1 = L3_1.find
L6_1 = "\\explorer.exe"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = IsProcNameInParentProcessTree
  L5_1 = "cmdhstr"
  L6_1 = L0_1
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.GetProcessCommandLine
L5_1 = L1_1
L4_1 = L4_1(L5_1)
if L4_1 == nil and L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L6_1 = L4_1
L5_1 = L4_1.gsub
L7_1 = "%s+"
L8_1 = " "
L5_1 = L5_1(L6_1, L7_1, L8_1)
L4_1 = L5_1
if L4_1 then
  L5_1 = #L4_1
  if not (L5_1 <= 60) then
    L5_1 = #L4_1
    if not (500 < L5_1) then
      goto lbl_74
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_74::
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "#(.*)"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L7_1 = L5_1
L6_1 = L5_1.match
L8_1 = "^%s*(.-)%s*$"
L6_1 = L6_1(L7_1, L8_1)
L5_1 = L6_1
L7_1 = L5_1
L6_1 = L5_1.match
L8_1 = "%.docx?$"
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L7_1 = L5_1
  L6_1 = L5_1.match
  L8_1 = "%.pdf$"
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    L7_1 = L5_1
    L6_1 = L5_1.match
    L8_1 = "%.xlsx$"
    L6_1 = L6_1(L7_1, L8_1)
  end
end
if not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L8_1 = L5_1
L7_1 = L5_1.match
L9_1 = "^\\\\"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L8_1 = L5_1
  L7_1 = L5_1.match
  L9_1 = "^%a:\\"
  L7_1 = L7_1(L8_1, L9_1)
end
if L7_1 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
