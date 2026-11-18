-- Threat: !InfrastructureShared
-- Name: 3b5b3cc5e1031
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local function l_0_0(l_1_0)
  local l_1_1 = "^(.+)//"
  
  local l_1_2 = "^(.+)\\"
  local l_1_3 = string.match(l_1_0, l_1_1) or string.match(l_1_0, l_1_2)
  if l_1_3 ~= nil then
    return l_1_3
  else
    return nil
  end
end

local l_0_1 = mp.SIGATTR_LOG_SZ
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = "%.[^%.%\\][%w_]+$"
for l_0_5 = 1, l_0_1 do
  local l_0_6 = 0
  if sigattr_tail[l_0_5].attribute == 16385 then
    local l_0_7 = sigattr_tail[l_0_5].utf8p1:lower()
    if l_0_7:byte(1) == 37 then
      l_0_6 = 1
    end
    if l_0_6 == 0 then
      l_0_2[mp.crc32(0, l_0_7, 1, #l_0_7)] = 1
    end
  end
end
for l_0_8 = 1, l_0_1 do
  local l_0_9 = sigattr_tail[l_0_8].attribute
  local l_0_10 = 0
  if l_0_9 == 16389 and sigattr_tail[l_0_8].utf8p2 == "ATTR_c09458eb" then
    local l_0_11 = sigattr_tail[l_0_8].utf8p1:lower()
    if l_0_11:byte(1) == 37 then
      l_0_10 = 1
    end
    if l_0_10 == 0 then
      local l_0_12 = mp.crc32(0, l_0_11, 1, #l_0_11)
      if l_0_2[l_0_12] ~= nil then
        l_0_3[l_0_12] = 1
      end
    end
  end
end
local l_0_13 = {}
for l_0_14 = 1, l_0_1 do
  if sigattr_tail[l_0_14].attribute == 16386 then
    local l_0_15 = sigattr_tail[l_0_14].utf8p2:lower()
    local l_0_16 = sigattr_tail[l_0_14].utf8p1:lower()
    local l_0_17 = l_0_15:match(l_0_4)
    local l_0_18 = l_0_16:match(l_0_4)
    if l_0_17 ~= nil and l_0_18 ~= nil then
      local l_0_19 = mp.crc32(0, l_0_16, 1, #l_0_16)
      if mp.GetExtensionClass(l_0_17) ~= 4 and mp.GetExtensionClass(l_0_18) == 0 and l_0_3[l_0_19] ~= nil then
        local l_0_20 = l_0_0(l_0_15)
        local l_0_21 = mp.crc32(0, l_0_20, 1, #l_0_20)
        if l_0_13[l_0_18] == nil then
          l_0_13[l_0_18] = {dirCount = 0, fileCount = 0}
        end
        if l_0_13[l_0_18][l_0_21] == nil then
          l_0_13[l_0_18].dirCount = l_0_13[l_0_18].dirCount + 1
          l_0_13[l_0_18][l_0_21] = {}
        end
        if l_0_13[l_0_18][l_0_21][l_0_19] == nil then
          l_0_13[l_0_18].fileCount = l_0_13[l_0_18].fileCount + 1
          l_0_13[l_0_18][l_0_21][l_0_19] = l_0_14
        end
      end
    end
  end
end
for l_0_22, l_0_23 in pairs(l_0_13) do
  if l_0_23.dirCount >= 3 and l_0_23.fileCount >= 6 or l_0_23.fileCount > 15 then
    bm.add_related_string("ransom_extension", l_0_22, bm.RelatedStringBMReport)
    local l_0_24 = {}
    local l_0_25 = bm.get_imagepath():lower()
    local l_0_26 = bm.get_current_process_startup_info()
    if l_0_26 ~= nil then
      l_0_26 = l_0_26.ppid
    else
      l_0_26 = -1
    end
    for l_0_27, l_0_28 in pairs(l_0_23) do
      if type(l_0_28) == "table" then
        for l_0_29, l_0_30 in pairs(l_0_28) do
          bm.add_related_file(sigattr_tail[l_0_30].utf8p1)
        end
      end
    end
    l_0_24.current_image_path = l_0_25
    l_0_24.extension = l_0_22
    l_0_24.ext_data = safeJsonSerialize(l_0_13)
    local l_0_31, l_0_32 = bm.get_process_relationships()
    for l_0_33, l_0_34 in ipairs(l_0_31) do
      if l_0_34.image_path ~= nil then
        bm.add_related_process(l_0_34.ppid)
      end
    end
    for l_0_35, l_0_36 in ipairs(l_0_32) do
      if l_0_36.image_path ~= nil then
        bm.add_related_process(l_0_36.ppid)
      end
    end
    MpCommon.OverwritePersistContextNoPath("gene_ransom_meta", l_0_24, 700)
    local l_0_37 = safeJsonSerialize(l_0_24)
    bm.add_related_string("GenericRansomware", l_0_37, bm.RelatedStringBMReport)
    bm.trigger_sig("GenericRansomware:Type2.4", l_0_37)
    bm.add_action("SmsAsyncScanEvent", 100)
    reportSessionInformationInclusive()
    reportTimingData()
    return mp.INFECTED
  end
end
return mp.CLEAN
