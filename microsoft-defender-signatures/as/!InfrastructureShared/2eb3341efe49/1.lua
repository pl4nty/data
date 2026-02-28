local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p1
    L2_1 = L1_1
    L1_1 = L1_1.lower
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 ~= nil then
  L1_1 = #L0_1
  if L1_1 ~= 0 then
    goto lbl_25
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_25::
L1_1 = contains
L2_1 = L0_1
L3_1 = {}
L4_1 = "winrar.exe"
L5_1 = "7zip.exe"
L6_1 = "peazip.exe"
L7_1 = "unrar.exe"
L8_1 = "7z.exe"
L9_1 = "360zip.exe"
L10_1 = "7zfm.exe"
L11_1 = "bandizip.exe"
L12_1 = "rar.exe"
L13_1 = "unrar.exe"
L14_1 = "haozip.exe"
L15_1 = "breezip.exe"
L16_1 = "netpowerzip.exe"
L17_1 = "xdzipapp.exe"
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
L3_1[14] = L17_1
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
