local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L5_1 = 2
L6_1 = this_sigattrlog
L6_1 = L6_1[7]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[7]
  L6_1 = L6_1.p2
  if L6_1 then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[7]
    L6_1 = L6_1.utf8p1
    L7_1 = L6_1
    L6_1 = L6_1.lower
    L6_1 = L6_1(L7_1)
    L0_1 = L6_1
    L6_1 = this_sigattrlog
    L6_1 = L6_1[7]
    L1_1 = L6_1.ppid
    L6_1 = this_sigattrlog
    L6_1 = L6_1[7]
    L2_1 = L6_1.image_path
    L3_1 = 1
end
else
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
if L2_1 == nil or L1_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.match
L7_1 = L2_1
L8_1 = "\\([^\\]+)$"
L6_1 = L6_1(L7_1, L8_1)
L4_1 = L6_1
if L4_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = bm
L6_1 = L6_1.get_current_process_startup_info
L6_1 = L6_1()
L7_1 = L6_1.ppid
L8_1 = L6_1.command_line
if L6_1 == nil or L7_1 == nil or L8_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = L3_1
L10_1 = "|"
L11_1 = L1_1
L12_1 = "|"
L13_1 = L2_1
L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1 .. L13_1
L10_1 = "OfficeGen"
L11_1 = L7_1
L10_1 = L10_1 .. L11_1
L11_1 = 3600
L12_1 = 10
L13_1 = AppendToRollingQueue
L14_1 = L10_1
L15_1 = L0_1
L16_1 = L9_1
L17_1 = L11_1
L18_1 = L12_1
L19_1 = 0
L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
L13_1 = bm_AddRelatedFileFromCommandLine
L14_1 = L8_1
L13_1 = L13_1(L14_1)
L14_1 = GetRollingQueue
L15_1 = L10_1
L14_1 = L14_1(L15_1)
if L14_1 ~= nil then
  L15_1 = type
  L16_1 = L14_1
  L15_1 = L15_1(L16_1)
  if L15_1 == "table" then
    goto lbl_96
  end
end
L15_1 = mp
L15_1 = L15_1.CLEAN
do return L15_1 end
::lbl_96::
L15_1 = {}
L15_1.doc = L13_1
L15_1.cmd = L8_1
L16_1 = {}
L15_1.detectionLog = L16_1
L16_1 = nil
L3_1 = 0
L17_1 = ipairs
L18_1 = L14_1
L17_1, L18_1, L19_1 = L17_1(L18_1)
for L20_1, L21_1 in L17_1, L18_1, L19_1 do
  L22_1 = explode
  L23_1 = L21_1.value
  L24_1 = "|"
  L22_1 = L22_1(L23_1, L24_1)
  L16_1 = L22_1
  L22_1 = table
  L22_1 = L22_1.insert
  L23_1 = L15_1.detectionLog
  L24_1 = {}
  L25_1 = L21_1.key
  L24_1.name = L25_1
  L25_1 = L16_1[2]
  L24_1.ppid = L25_1
  L25_1 = L21_1.insert_time
  L24_1.timestamp = L25_1
  L25_1 = L16_1[3]
  L24_1.file = L25_1
  L22_1(L23_1, L24_1)
  L22_1 = L16_1[1]
  L3_1 = L3_1 + L22_1
end
if L5_1 <= L3_1 then
  L17_1 = bm
  L17_1 = L17_1.add_related_string
  L18_1 = "officegen"
  L19_1 = safeJsonSerialize
  L20_1 = L15_1
  L19_1 = L19_1(L20_1)
  L20_1 = bm
  L20_1 = L20_1.RelatedStringBMReport
  L17_1(L18_1, L19_1, L20_1)
  L17_1 = mp
  L17_1 = L17_1.INFECTED
  return L17_1
end
L17_1 = mp
L17_1 = L17_1.CLEAN
return L17_1
