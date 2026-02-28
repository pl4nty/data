local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
if L1_1 == nil then
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
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L7_1 = L5_1
L6_1 = L5_1.gsub
L8_1 = "%s+"
L9_1 = " "
L6_1 = L6_1(L7_1, L8_1, L9_1)
L5_1 = L6_1
if L5_1 then
  L6_1 = #L5_1
  if not (L6_1 <= 60) then
    L6_1 = #L5_1
    if not (2200 < L6_1) then
      goto lbl_78
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_78::
L7_1 = L5_1
L6_1 = L5_1.match
L8_1 = "#(.*)"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 == nil then
  L8_1 = L5_1
  L7_1 = L5_1.match
  L9_1 = "' ([a-z]):\\(.*)"
  L7_1, L8_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    L9_1 = not L8_1
    if L9_1 ~= nil then
      L9_1 = L7_1
      L10_1 = ":\\"
      L11_1 = L8_1
      L6_1 = L9_1 .. L10_1 .. L11_1
    end
  end
end
if L6_1 ~= nil then
  L8_1 = L6_1
  L7_1 = L6_1.match
  L9_1 = "%.exe "
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    goto lbl_105
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_105::
L8_1 = L6_1
L7_1 = L6_1.gsub
L9_1 = "['\"%s]+$"
L10_1 = ""
L7_1 = L7_1(L8_1, L9_1, L10_1)
L6_1 = L7_1
L8_1 = L6_1
L7_1 = L6_1.gsub
L9_1 = "^['\"%s]+"
L10_1 = ""
L7_1 = L7_1(L8_1, L9_1, L10_1)
L6_1 = L7_1
L8_1 = L6_1
L7_1 = L6_1.match
L9_1 = "^\\\\"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L8_1 = L6_1
  L7_1 = L6_1.match
  L9_1 = "^%a:\\"
  L7_1 = L7_1(L8_1, L9_1)
end
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = "^[a-z]?:?\\[a-z0-9 _%.%-\\]+\\[a-z0-9 _%.%-]+%.%a%a%a%a?$"
L10_1 = L6_1
L9_1 = L6_1.match
L11_1 = L8_1
L9_1 = L9_1(L10_1, L11_1)
if L9_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L10_1 = L6_1
L9_1 = L6_1.match
L11_1 = "%.docx?$"
L9_1 = L9_1(L10_1, L11_1)
if not L9_1 then
  L10_1 = L6_1
  L9_1 = L6_1.match
  L11_1 = "%.pdf$"
  L9_1 = L9_1(L10_1, L11_1)
  if not L9_1 then
    L10_1 = L6_1
    L9_1 = L6_1.match
    L11_1 = "%.xlsx?$"
    L9_1 = L9_1(L10_1, L11_1)
    if not L9_1 then
      L10_1 = L6_1
      L9_1 = L6_1.match
      L11_1 = "%.pptx?$"
      L9_1 = L9_1(L10_1, L11_1)
    end
  end
end
if not L9_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L11_1 = L4_1
L10_1 = L4_1.match
L12_1 = "                                  #"
L10_1 = L10_1(L11_1, L12_1)
if not L10_1 then
  L11_1 = L4_1
  L10_1 = L4_1.match
  L12_1 = "#                                  "
  L10_1 = L10_1(L11_1, L12_1)
  if not L10_1 then
    L11_1 = L4_1
    L10_1 = L4_1.match
    L12_1 = "                                               (%a:)?\\"
    L10_1 = L10_1(L11_1, L12_1)
  end
end
if L10_1 then
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
