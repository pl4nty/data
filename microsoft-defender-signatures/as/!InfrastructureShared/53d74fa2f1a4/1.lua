local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 <= 60) then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = {}
L3_1 = "c:\\"
L4_1 = "d:\\"
L5_1 = "e:\\"
L6_1 = "f:\\"
L7_1 = "g:\\"
L8_1 = "h:\\"
L9_1 = "l:\\"
L10_1 = "http"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = ".docx"
L5_1 = ".pdf"
L6_1 = ".txt"
L7_1 = ".hta"
L8_1 = ".ps1"
L9_1 = ".dof"
L10_1 = "verif"
L11_1 = "ray"
L12_1 = "start-process"
L13_1 = "iex"
L14_1 = "iwr"
L15_1 = "net.webclient"
L16_1 = "downloadstring"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L3_1[11] = L14_1
L3_1[12] = L15_1
L3_1[13] = L16_1
L4_1 = contains
L5_1 = L1_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetParentProcInfo
L4_1 = L4_1()
if L4_1 ~= nil then
  L5_1 = L4_1.image_path
  if L5_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1.image_path
    L5_1 = L5_1(L6_1)
    L7_1 = L5_1
    L6_1 = L5_1.match
    L8_1 = "([^\\]+)$"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 == "explorer.exe" then
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
