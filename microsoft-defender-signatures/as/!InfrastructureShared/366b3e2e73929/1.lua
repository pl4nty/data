local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L2_1 = 0
L3_1 = 0
L4_1 = this_sigattrlog
L4_1 = L4_1[18]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[18]
  L4_1 = L4_1.utf8p2
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[18]
    L0_1 = L4_1.utf8p2
  end
end
if not L0_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L0_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = StringStartsWith
L5_1 = L0_1
L6_1 = "."
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = ".tmp"
L6_1 = ".temp"
L7_1 = ".rename"
L8_1 = ".nm!"
L9_1 = ".bin"
L10_1 = ".~mt"
L11_1 = ".~tmp"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L5_1 = contains
L6_1 = L0_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = L0_1
L7_1 = "%.d+$"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.len
L6_1 = L0_1
L5_1 = L5_1(L6_1)
if not (L5_1 < 4) then
  L5_1 = IsExtensionDatePattern
  L6_1 = L0_1
  L5_1 = L5_1(L6_1)
  if L5_1 ~= true then
    L5_1 = string
    L5_1 = L5_1.match
    L6_1 = L0_1
    L7_1 = "%d+.%d+.%d+"
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.match
      L6_1 = L0_1
      L7_1 = "%.%w+%.%w+$"
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        goto lbl_91
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_91::
L5_1 = mp
L5_1 = L5_1.bitand
L6_1 = mp
L6_1 = L6_1.GetExtensionClass
L7_1 = L0_1
L6_1 = L6_1(L7_1)
L7_1 = 3
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= 0 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = this_sigattrlog
L5_1 = L5_1[19]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[19]
  L5_1 = L5_1.utf8p2
  if L5_1 then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[19]
    L1_1 = L5_1.utf8p2
end
else
  L5_1 = this_sigattrlog
  L5_1 = L5_1[20]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[20]
    L5_1 = L5_1.utf8p2
    if L5_1 then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[20]
      L1_1 = L5_1.utf8p2
    end
  end
end
if not L1_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = safeJsonDeserialize
L6_1 = L1_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = {}
L6_1[".7z"] = true
L6_1[".accdb"] = true
L6_1[".accde"] = true
L6_1[".avi"] = true
L6_1[".bmp"] = true
L6_1[".cmd"] = true
L6_1[".csv"] = true
L6_1[".dbf"] = true
L6_1[".doc"] = true
L6_1[".docb"] = true
L6_1[".docm"] = true
L6_1[".docx"] = true
L6_1[".dot"] = true
L6_1[".dotm"] = true
L6_1[".dotx"] = true
L6_1[".dwg"] = true
L6_1[".dws"] = true
L6_1[".dxf"] = true
L6_1[".email"] = true
L6_1[".eml"] = true
L6_1[".gif"] = true
L6_1[".gpg"] = true
L6_1[".gz"] = true
L6_1[".hsf"] = true
L6_1[".htm"] = true
L6_1[".html"] = true
L6_1[".igs"] = true
L6_1[".jpg"] = true
L6_1[".jpeg"] = true
L6_1[".json"] = true
L6_1[".kdb"] = true
L6_1[".kdbx"] = true
L6_1[".lnk"] = true
L6_1[".mdb"] = true
L6_1[".mp3"] = true
L6_1[".mp4"] = true
L6_1[".mpeg"] = true
L6_1[".mpg"] = true
L6_1[".msg"] = true
L6_1[".ost"] = true
L6_1[".png"] = true
L6_1[".pdf"] = true
L6_1[".pgp"] = true
L6_1[".pos"] = true
L6_1[".potm"] = true
L6_1[".potx"] = true
L6_1[".ppam"] = true
L6_1[".pps"] = true
L6_1[".ppsx"] = true
L6_1[".ppt"] = true
L6_1[".pptm"] = true
L6_1[".pptx"] = true
L6_1[".pst"] = true
L6_1[".rar"] = true
L6_1[".shp"] = true
L6_1[".shx"] = true
L6_1[".skp"] = true
L6_1[".sql"] = true
L6_1[".tlg"] = true
L6_1[".tsv"] = true
L6_1[".txt"] = true
L6_1[".vcf"] = true
L6_1[".vsd"] = true
L6_1[".vsdm"] = true
L6_1[".xlam"] = true
L6_1[".xlm"] = true
L6_1[".xls"] = true
L6_1[".xlsb"] = true
L6_1[".xlsm"] = true
L6_1[".xlsx"] = true
L6_1[".xlt"] = true
L6_1[".xltm"] = true
L6_1[".xltx"] = true
L6_1[".xlw"] = true
L6_1[".xml"] = true
L6_1[".yaml"] = true
L6_1[".yml"] = true
L6_1[".zip"] = true
L6_1[".exe"] = true
L7_1 = L5_1.file_list
L8_1 = isnull
L9_1 = L7_1
L8_1 = L8_1(L9_1)
if L8_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = {}
L9_1 = 1
L10_1 = #L7_1
L11_1 = 1
for L12_1 = L9_1, L10_1, L11_1 do
  L13_1 = L12_1 % 2
  if L13_1 == 0 then
    L13_1 = table
    L13_1 = L13_1.insert
    L14_1 = L8_1
    L15_1 = L7_1[L12_1]
    L13_1(L14_1, L15_1)
  end
end
L9_1 = pairs
L10_1 = L8_1
L9_1, L10_1, L11_1 = L9_1(L10_1)
for L12_1, L13_1 in L9_1, L10_1, L11_1 do
  L14_1 = StringStartsWith
  L15_1 = L13_1
  L16_1 = "\\\\"
  L14_1 = L14_1(L15_1, L16_1)
  if L14_1 then
    L3_1 = L3_1 + 1
  end
  L14_1 = string
  L14_1 = L14_1.lower
  L16_1 = L13_1
  L15_1 = L13_1.match
  L17_1 = "(%.[^.]+)$"
  L15_1, L16_1, L17_1 = L15_1(L16_1, L17_1)
  L14_1 = L14_1(L15_1, L16_1, L17_1)
  L14_1 = L6_1[L14_1]
  if L14_1 then
    L2_1 = L2_1 + 1
  end
end
if 5 <= L3_1 then
  L9_1 = bm
  L9_1 = L9_1.trigger_sig
  L10_1 = "GenRansom_SD_RemotePath"
  L11_1 = safeJsonSerialize
  L12_1 = L5_1
  L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L11_1(L12_1)
  L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
end
if 5 <= L2_1 then
  L9_1 = bm
  L9_1 = L9_1.set_detection_string
  L10_1 = safeJsonSerialize
  L11_1 = L5_1
  L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L10_1(L11_1)
  L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
