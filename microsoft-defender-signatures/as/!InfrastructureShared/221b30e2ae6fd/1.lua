local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1)
L1_1 = false
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = #L2_1
if 450 < L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = #L2_1
if L3_1 < 70 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = StringEndsWith
L4_1 = L2_1
L5_1 = "\\powershell.exe\""
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = StringEndsWith
L4_1 = L2_1
L5_1 = "\\powershell_ise.exe\""
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_process_relationships
L3_1, L4_1 = L3_1()
L5_1 = ipairs
L6_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = L9_1.image_path
  if L10_1 ~= nil then
    L10_1 = mp
    L10_1 = L10_1.bitand
    L11_1 = L9_1.reason_ex
    L12_1 = 1
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 == 1 then
      L10_1 = string
      L10_1 = L10_1.lower
      L11_1 = string
      L11_1 = L11_1.sub
      L12_1 = L9_1.image_path
      L13_1 = -13
      L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1 = L11_1(L12_1, L13_1)
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1)
      if L10_1 == "\\explorer.exe" then
        L1_1 = true
        break
      end
    end
  end
end
if not L1_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = contains
L6_1 = L2_1
L7_1 = {}
L8_1 = "host.ui.rawui.windowtitle"
L9_1 = ".ps1"
L10_1 = ".hta"
L11_1 = "Update.exe"
L12_1 = "msedge"
L13_1 = "\\pwsh.exe"
L14_1 = "iexplore"
L15_1 = "slack"
L16_1 = "chrome"
L17_1 = "acrord32"
L18_1 = "loom.exe"
L19_1 = "excel"
L20_1 = "onenote"
L21_1 = "winword"
L22_1 = "powerpnt"
L23_1 = "onenote"
L24_1 = "outlook"
L25_1 = "signal"
L26_1 = "start menu"
L27_1 = "program files"
L28_1 = "embedhook-x86.exe"
L29_1 = "canva"
L30_1 = "synccontroller"
L31_1 = "acrobat"
L32_1 = "firefox"
L33_1 = "accenture"
L34_1 = "articulate"
L35_1 = "bluestacks"
L36_1 = "explorer"
L37_1 = "install-win.ps1"
L7_1[1] = L8_1
L7_1[2] = L9_1
L7_1[3] = L10_1
L7_1[4] = L11_1
L7_1[5] = L12_1
L7_1[6] = L13_1
L7_1[7] = L14_1
L7_1[8] = L15_1
L7_1[9] = L16_1
L7_1[10] = L17_1
L7_1[11] = L18_1
L7_1[12] = L19_1
L7_1[13] = L20_1
L7_1[14] = L21_1
L7_1[15] = L22_1
L7_1[16] = L23_1
L7_1[17] = L24_1
L7_1[18] = L25_1
L7_1[19] = L26_1
L7_1[20] = L27_1
L7_1[21] = L28_1
L7_1[22] = L29_1
L7_1[23] = L30_1
L7_1[24] = L31_1
L7_1[25] = L32_1
L7_1[26] = L33_1
L7_1[27] = L34_1
L7_1[28] = L35_1
L7_1[29] = L36_1
L7_1[30] = L37_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
