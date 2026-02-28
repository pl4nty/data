local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = "%%.*:~.*%%"
L4_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = contains
L2_1 = L0_1
L3_1 = "echo %%%w+:~0,2%%"
L4_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = "%%allusersprofile:~"
L3_1 = "%%appdata:~"
L4_1 = "%%commonprogramfiles%(x86%):~"
L5_1 = "%%commonprogramfiles:~"
L6_1 = "%%commonprogramw6432:~"
L7_1 = "%%comspec:~"
L8_1 = "%%localappdata:~"
L9_1 = "%%programdata:~"
L10_1 = "%%programfiles%(x86%):~"
L11_1 = "%%programfiles:~"
L12_1 = "%%programw6432:~"
L13_1 = "%%psmodulepath:~"
L14_1 = "%%public:~"
L15_1 = "%%systemdrive:~"
L16_1 = "%%systemroot:~"
L17_1 = "%%temp:~"
L18_1 = "%%tmp:~"
L19_1 = "%%userprofile:~"
L20_1 = "%%windir:~"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L1_1[11] = L12_1
L1_1[12] = L13_1
L1_1[13] = L14_1
L1_1[14] = L15_1
L1_1[15] = L16_1
L1_1[16] = L17_1
L1_1[17] = L18_1
L1_1[18] = L19_1
L1_1[19] = L20_1
L2_1 = "%s*[%-%+]?%d+%s*,%s*[%-%+]?%d+%s*%%"
L3_1 = pairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = contains
  L9_1 = L0_1
  L10_1 = L7_1
  L11_1 = L2_1
  L10_1 = L10_1 .. L11_1
  L11_1 = false
  L8_1 = L8_1(L9_1, L10_1, L11_1)
  if L8_1 then
    L8_1 = bm
    L8_1 = L8_1.add_related_string
    L9_1 = "ShellEncode_cmdline"
    L10_1 = L0_1
    L11_1 = bm
    L11_1 = L11_1.RelatedStringBMReport
    L8_1(L9_1, L10_1, L11_1)
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
