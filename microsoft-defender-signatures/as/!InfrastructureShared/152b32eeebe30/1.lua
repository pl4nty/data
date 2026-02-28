local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L0_1 = L1_1.utf8p1
  end
end
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "imagename:([^;]+)"
L1_1 = L1_1(L2_1, L3_1)
L0_1 = L1_1
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = "\\"
L2_1 = L0_1
L0_1 = L1_1 .. L2_1
L1_1 = 1
L2_1 = mp
L2_1 = L2_1.SIGATTR_LOG_SZ
L3_1 = 1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = sigattr_tail
  L5_1 = L5_1[L4_1]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = sigattr_tail
    L5_1 = L5_1[L4_1]
    L5_1 = L5_1.attribute
    if L5_1 == 16400 then
      L5_1 = sigattr_tail
      L5_1 = L5_1[L4_1]
      L5_1 = L5_1.utf8p1
      if L0_1 ~= nil and L0_1 ~= "" then
        L6_1 = string
        L6_1 = L6_1.lower
        L7_1 = L5_1
        L6_1 = L6_1(L7_1)
        L5_1 = L6_1
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L5_1
        L8_1 = L0_1
        L9_1 = 1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if L6_1 then
          L6_1 = {}
          L7_1 = "powershell"
          L8_1 = "rundll32"
          L9_1 = "msiexec"
          L10_1 = "mshta"
          L11_1 = "bitsadmin"
          L12_1 = "curl"
          L13_1 = "conhost"
          L14_1 = "control"
          L15_1 = "regsvr32"
          L16_1 = "wscript"
          L17_1 = "cscript"
          L18_1 = "javaws"
          L19_1 = "wmic"
          L20_1 = "scriptrunner"
          L21_1 = "certutil"
          L22_1 = "winrm"
          L23_1 = "python"
          L6_1[1] = L7_1
          L6_1[2] = L8_1
          L6_1[3] = L9_1
          L6_1[4] = L10_1
          L6_1[5] = L11_1
          L6_1[6] = L12_1
          L6_1[7] = L13_1
          L6_1[8] = L14_1
          L6_1[9] = L15_1
          L6_1[10] = L16_1
          L6_1[11] = L17_1
          L6_1[12] = L18_1
          L6_1[13] = L19_1
          L6_1[14] = L20_1
          L6_1[15] = L21_1
          L6_1[16] = L22_1
          L6_1[17] = L23_1
          L7_1 = contains
          L8_1 = L5_1
          L9_1 = L6_1
          L7_1 = L7_1(L8_1, L9_1)
          if L7_1 then
            L7_1 = mp
            L7_1 = L7_1.INFECTED
            return L7_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
