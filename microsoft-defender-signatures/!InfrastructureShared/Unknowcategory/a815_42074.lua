-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a815_42074.luac 

-- params : ...
-- function num : 0
table_hasvalue = function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5,l_1_6 in ipairs(l_1_0) do
    if l_1_6 == l_1_1 then
      return l_1_5
    end
  end
  return false
end

table_contains = function(l_2_0, l_2_1)
  -- function num : 0_1
  for l_2_5,l_2_6 in ipairs(l_2_0) do
    if (string.find)(l_2_6, l_2_1, 1, true) then
      return l_2_5
    end
  end
  return false
end

GetMagicFromExtension = function(l_3_0)
  -- function num : 0_2
  l_3_0 = l_3_0:lower()
  local l_3_1 = {}
  l_3_1[".acm"] = "\\x4d\\x5a"
  l_3_1[".ax"] = "\\x4d\\x5a"
  l_3_1[".cpl"] = "\\x4d\\x5a"
  l_3_1[".dll"] = "\\x4d\\x5a"
  l_3_1[".drv"] = "\\x4d\\x5a"
  l_3_1[".efi"] = "\\x4d\\x5a"
  l_3_1[".exe"] = "\\x4d\\x5a"
  l_3_1[".mui"] = "\\x4d\\x5a"
  l_3_1[".ocx"] = "\\x4d\\x5a"
  l_3_1[".scr"] = "\\x4d\\x5a"
  l_3_1[".sys"] = "\\x4d\\x5a"
  l_3_1[".tsp"] = "\\x4d\\x5a"
  l_3_1[".xml"] = "\\x3c\\x3f"
  l_3_1[".bmp"] = "\\x42\\x4d"
  l_3_1[".bz2"] = "\\x42\\x5a"
  l_3_1[".tbz"] = "\\x42\\x5a"
  l_3_1[".jpg"] = "\\xff\\xd8"
  l_3_1[".jpeg"] = "\\xff\\xd8"
  l_3_1[".zip"] = "\\x50\\x4b"
  l_3_1[".docx"] = "\\x50\\x4b"
  l_3_1[".docm"] = "\\x50\\x4b"
  l_3_1[".dotx"] = "\\x50\\x4b"
  l_3_1[".dotm"] = "\\x50\\x4b"
  l_3_1[".xlsx"] = "\\x50\\x4b"
  l_3_1[".xlsm"] = "\\x50\\x4b"
  l_3_1[".xlam"] = "\\x50\\x4b"
  l_3_1[".xltm"] = "\\x50\\x4b"
  l_3_1[".pptx"] = "\\x50\\x4b"
  l_3_1[".pptm"] = "\\x50\\x4b"
  l_3_1[".appx"] = "\\x50\\x4b"
  l_3_1[".sh"] = "\\x23\\x21"
  l_3_1[".mp3"] = "\\x49\\x44"
  l_3_1[".swf"] = "\\x46\\x57"
  l_3_1[".flv"] = "\\x46\\x4c"
  l_3_1[".ogg"] = "\\x4f\\x67"
  l_3_1[".gz"] = "\\x1f\\x8b"
  l_3_1[".mp4"] = "\\x00\\x00"
  l_3_1[".gzip"] = "\\x1f\\x8b"
  l_3_1[".tgz"] = "\\x1f\\x8b"
  l_3_1[".slk"] = "\\x49\\x44"
  l_3_1[".tiff"] = "\\x4d\\x4d\\x00\\x2a"
  l_3_1[".cab"] = "\\x4d\\x53\\x43\\x46"
  l_3_1[".mid"] = "\\x4d\\x54\\x68\\x64"
  l_3_1[".midi"] = "\\x4d\\x54\\x68\\x64"
  l_3_1[".dmp"] = "\\x4d\\x44\\x4d\\x50"
  l_3_1[".mdmp"] = "\\x4d\\x44\\x4d\\x50"
  l_3_1[".doc"] = "\\xd0\\xcf\\x11\\xe0"
  l_3_1[".xls"] = "\\xd0\\xcf\\x11\\xe0"
  l_3_1[".ppt"] = "\\xd0\\xcf\\x11\\xe0"
  l_3_1[".msi"] = "\\xd0\\xcf\\x11\\xe0"
  l_3_1[".msg"] = "\\xd0\\xcf\\x11\\xe0"
  l_3_1[".png"] = "\\x89\\x50\\x4e\\x47"
  l_3_1[".gif"] = "\\x47\\x49\\x46\\x38"
  l_3_1[".woff"] = "\\x77\\x4f\\x46\\x46"
  l_3_1[".rar"] = "\\x52\\x61\\x72\\x21"
  l_3_1[".7z"] = "\\x37\\x7a\\xbc\\xaf"
  l_3_1[".7zip"] = "\\x37\\x7a\\xbc\\xaf"
  l_3_1[".crx"] = "\\x43\\x72\\x32\\x34"
  l_3_1[".ttf"] = "\\x00\\x01\\x00\\x00"
  l_3_1[".dex"] = "\\x64\\x65\\x78\\x0a"
  l_3_1[".deb"] = "\\x21\\x3c\\x61\\x72"
  l_3_1[".pst"] = "\\x21\\x42\\x44\\x4e"
  l_3_1[".vbe"] = "\\x23\\x40\\x7e\\x5e"
  l_3_1[".dwg"] = "\\x41\\x43\\x31\\x30"
  l_3_1[".riff"] = "\\x52\\x49\\x46\\x46"
  l_3_1[".webp"] = "\\x52\\x49\\x46\\x46"
  l_3_1[".sis"] = "\\x7a\\x1a\\x20\\x10"
  l_3_1[".sisx"] = "\\x7a\\x1a\\x20\\x10"
  l_3_1[".lnk"] = "\\x4c\\x00\\x00\\x00"
  l_3_1[".arw"] = "\\x49\\x49\\x2a\\x00"
  l_3_1[".nef"] = "\\x49\\x49\\x2a\\x00"
  l_3_1[".cr2"] = "\\x49\\x49\\x2a\\x00"
  l_3_1[".rw2"] = "\\x49\\x49\\x55\\x00"
  l_3_1[".psd"] = "\\x38\\x42\\x50\\x53"
  l_3_1[".w3n"] = "\\x48\\x4d\\x33\\x57"
  l_3_1[".rtf"] = "\\x7b\\x5c\\x72\\x74"
  l_3_1[".pdf"] = "\\x25\\x50\\x44\\x46"
  l_3_1[".sqlite"] = "\\x53\\x51\\x4c\\x69"
  l_3_1[".sqlite3"] = "\\x53\\x51\\x4c\\x69"
  l_3_1[".s3db"] = "\\x53\\x51\\x4c\\x69"
  l_3_1[".pnf"] = "\\x01\\x03\\x02\\x00"
  l_3_1[".class"] = "\\xca\\xfe\\xba\\xbe"
  l_3_1[".jsp"] = "\\xca\\xfe\\xba\\xbe"
  return l_3_1[l_3_0]
end

ExtensionToMagicMismatch = function(l_4_0, l_4_1)
  -- function num : 0_3
  l_4_0 = l_4_0:lower()
  l_4_1 = l_4_1:lower()
  local l_4_2 = GetMagicFromExtension(l_4_0)
  if #l_4_1 < 8 or l_4_2 == nil then
    return nil
  end
  -- DECOMPILER ERROR at PC29: Unhandled construct in 'MakeBoolean' P1

  if #l_4_2 <= #l_4_1 and (string.sub)(l_4_1, 1, #l_4_2) ~= l_4_2 then
    return true
  end
  if (string.sub)(l_4_2, 1, #l_4_1) ~= l_4_1 then
    return true
  end
  return false
end

in_array = function(l_5_0, l_5_1)
  -- function num : 0_4
  for l_5_5,l_5_6 in pairs(l_5_0) do
    if l_5_6 == l_5_1 then
      return l_5_5
    end
  end
  return false
end

table_lookup = function(l_6_0, l_6_1)
  -- function num : 0_5
  local l_6_2 = {}
  for l_6_6,l_6_7 in ipairs(l_6_0) do
    if l_6_7.key == l_6_1 then
      (table.insert)(l_6_2, l_6_6)
    end
  end
  do
    return #l_6_2 > 0 and l_6_2 or false
  end
end

table_lookup_keys = function(l_7_0, l_7_1)
  -- function num : 0_6
  local l_7_2 = {}
  for l_7_6,l_7_7 in ipairs(l_7_0) do
    for l_7_11,l_7_12 in ipairs(l_7_1) do
      if l_7_7.key == l_7_12 then
        (table.insert)(l_7_2, l_7_11)
      end
    end
  end
  do
    return #l_7_2 > 0 and l_7_2 or false
  end
end

table_concat_r = function(l_8_0, l_8_1, l_8_2, l_8_3)
  -- function num : 0_7
  local l_8_4 = false
  local l_8_5 = nil
  for l_8_9,l_8_10 in ipairs(l_8_0) do
    l_8_5 = false
    for l_8_14,l_8_15 in ipairs(l_8_1) do
      if l_8_5 then
        l_8_5 = l_8_5 .. l_8_2 .. l_8_10[l_8_15]
      else
        l_8_5 = l_8_10[l_8_15]
      end
    end
    if l_8_4 then
      l_8_4 = l_8_4 .. l_8_3 .. l_8_5
    else
      l_8_4 = l_8_5
    end
  end
  return l_8_4
end

table_concat_kv = function(l_9_0, l_9_1, l_9_2)
  -- function num : 0_8
  local l_9_3 = false
  local l_9_4 = nil
  for l_9_8,l_9_9 in pairs(l_9_0) do
    l_9_4 = l_9_8 .. l_9_1 .. l_9_9
    if l_9_3 then
      l_9_3 = l_9_3 .. l_9_2 .. l_9_4
    else
      l_9_3 = l_9_4
    end
  end
  return l_9_3
end

table_cleanup = function(l_10_0)
  -- function num : 0_9
  local l_10_1 = {}
  for l_10_5,l_10_6 in pairs(l_10_0) do
    if l_10_6 ~= "" and #trim(l_10_6) > 0 then
      l_10_1[l_10_5] = l_10_6
    end
  end
  return l_10_1
end

table_dedup = function(l_11_0)
  -- function num : 0_10
  local l_11_1 = {}
  local l_11_2 = {}
  for l_11_6,l_11_7 in ipairs(l_11_0) do
    if not l_11_1[l_11_7] then
      l_11_2[#l_11_2 + 1] = l_11_7
      l_11_1[l_11_7] = true
    end
  end
  return l_11_2
end

table_dedup_caseinsensitive = function(l_12_0)
  -- function num : 0_11
  local l_12_1 = {}
  local l_12_2 = {}
  for l_12_6,l_12_7 in ipairs(l_12_0) do
    l_12_7 = (string.lower)(l_12_7)
    if not l_12_1[l_12_7] then
      l_12_2[#l_12_2 + 1] = l_12_7
      l_12_1[l_12_7] = true
    end
  end
  return l_12_2
end

table_merge = function(...)
  -- function num : 0_12
  for l_13_4,l_13_5 in ipairs({...}) do
    local l_13_1 = {}
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R6 in 'UnsetPending'

    for l_13_9 = 1, #R6_PC8 do
      l_13_1[#l_13_1 + 1] = l_13_6[l_13_10]
    end
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  return l_13_1
end

convert_to_hashtable = function(l_14_0, l_14_1)
  -- function num : 0_13
  if not l_14_1 then
    l_14_1 = {}
  end
  if l_14_0 then
    for l_14_5,l_14_6 in pairs(l_14_0) do
      l_14_1[l_14_6] = 0
    end
  end
  do
    return l_14_1
  end
end

deepCopy = function(l_15_0, l_15_1)
  -- function num : 0_14
  if not l_15_1 then
    l_15_1 = {}
  end
  local l_15_2 = nil
  if type(l_15_0) == "table" then
    if l_15_1[l_15_0] then
      l_15_2 = l_15_1[l_15_0]
    else
      l_15_2 = {}
      l_15_1[l_15_0] = l_15_2
      for l_15_6,l_15_7 in next do
        local l_15_8 = deepCopy(l_15_6, l_15_1)
        l_15_2[l_15_8] = deepCopy(l_15_7, l_15_1)
      end
    end
  else
    do
      l_15_2 = l_15_0
      return l_15_2
    end
  end
end

UpdateScalarCounter = function(l_16_0, l_16_1)
  -- function num : 0_15
  do
    if (MpCommon.GetPersistContextNoPath)(l_16_0) == nil then
      local l_16_2 = 0
    end
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

    if type(l_16_2) ~= "number" then
      local l_16_3 = 0 + l_16_1
      local l_16_4 = MpCommon.OverwritePersistContextNoPath
      local l_16_5 = l_16_0
      local l_16_6 = {}
      -- DECOMPILER ERROR at PC19: No list found for R5 , SetList fails

      -- DECOMPILER ERROR at PC20: Overwrote pending register: R6 in 'AssignReg'

      l_16_4(l_16_5, l_16_6, l_16_3)
      return l_16_3
    end
  end
end

table_pack = function(...)
  -- function num : 0_16
  return {...}
end

table_unpack = function(l_18_0, l_18_1)
  -- function num : 0_17
  if not l_18_1 then
    l_18_1 = 1
  end
  if l_18_0[l_18_1] ~= nil then
    return l_18_0[l_18_1], table_unpack(l_18_0, l_18_1 + 1)
  end
end

table_ipairs_filter = function(l_19_0, l_19_1)
  -- function num : 0_18
  if l_19_0 == nil or type(l_19_0) ~= "table" or l_19_1 == nil or type(l_19_1) ~= "table" then
    return 0
  end
  if #l_19_0 > 256 then
    return 0
  end
  if #l_19_1 % 2 ~= 0 then
    return 0
  end
  local l_19_2 = {}
  for l_19_6,l_19_7 in ipairs(l_19_0) do
    local l_19_8 = 0
    for l_19_12 = 1, #l_19_1, 2 do
      local l_19_13 = l_19_1[l_19_12]
      local l_19_14 = l_19_1[l_19_12 + 1]
      -- DECOMPILER ERROR at PC67: Unhandled construct in 'MakeBoolean' P1

      if l_19_13 ~= nil and l_19_7[l_19_13] ~= nil and l_19_14 ~= nil and type(l_19_14) == "string" and (string.find)((string.lower)(l_19_7[l_19_13]), (string.lower)(l_19_14), 1, true) then
        l_19_8 = l_19_8 + 1
      end
      if l_19_7[l_19_13] == l_19_14 then
        l_19_8 = l_19_8 + 1
      end
    end
    if l_19_8 == #l_19_1 / 2 then
      (table.insert)(l_19_2, l_19_7)
    end
  end
  return l_19_2
end

json_encode = function(l_20_0, l_20_1)
  -- function num : 0_19
  if l_20_1 == nil then
    l_20_1 = true
  end
  return encode_json_worker(l_20_0, l_20_1)
end

-- DECOMPILER ERROR at PC230: freeLocal<0 in 'ReleaseLocals'

-- WARNING: undefined locals caused missing assignments!

