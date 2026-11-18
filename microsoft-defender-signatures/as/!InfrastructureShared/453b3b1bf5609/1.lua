-- Threat: !InfrastructureShared
-- Name: 453b3b1bf5609
-- Type: 21
-- Includes: LuaFuncHelper

function reportGenEncryption(l_1_0, l_1_1)
  local l_1_2 = {}
  
  local l_1_3 = 0
  local l_1_4 = mp.SIGATTR_LOG_SZ
  local l_1_5 = ""
  if l_1_1 == 1 then
    l_1_5 = "FileAppendBucket1-16"
  elseif l_1_1 == 2 then
    l_1_5 = "FullFileOverwrite"
  else
    return mp.CLEAN
  end
  for l_1_6 = 1, l_1_4 do
    for l_1_7, l_1_8 in pairs(l_1_0) do
      if sigattr_tail[l_1_6].attribute == 16386 and sigattr_tail[l_1_6].utf8p1:byte(1) ~= 37 and sigattr_tail[l_1_6].utf8p2 == sigattr_tail[l_1_7].utf8p1 then
        l_1_0[l_1_7].RenamedPath = sigattr_tail[l_1_6].utf8p1
      end
    end
  end
  local l_1_9 = 0
  for l_1_10, l_1_11 in pairs(l_1_0) do
    local l_1_12 = l_1_11.path
    local l_1_13 = sysio.GetFileSize(l_1_12)
    if l_1_13 == nil then
      l_1_12 = l_1_11.RenamedPath
      l_1_13 = sysio.GetFileSize(l_1_12)
    end
    if l_1_13 ~= nil and 256 < l_1_13 then
      local l_1_14 = sysio.ReadFile(l_1_12, 0, 256)
      if l_1_14 ~= nil then
        local l_1_15 = string.format("0x%02X%02X%02X%02X", string.byte(l_1_14, 1, 4))
        local l_1_16 = crypto.ComputeEntropy(l_1_14)
        if l_1_9 == 0 or l_1_9 > l_1_16 then
          l_1_9 = l_1_16
        end
        if l_1_11.RenamedPath == l_1_12 then
          table.insert(l_1_2, {
            org_path = l_1_11.path,
            path = l_1_12,
            fileSize = l_1_13,
            magic = l_1_15,
            entropy = l_1_16,
            appended_size = tonumber(l_1_11.TotalSizeAppend),
            write_size = tonumber(l_1_11.TotalSizeWrite)
          })
        else
          table.insert(l_1_2, {
            path = l_1_12,
            fileSize = l_1_13,
            magic = l_1_15,
            entropy = l_1_16,
            appended_size = tonumber(l_1_11.TotalSizeAppend),
            write_size = tonumber(l_1_11.TotalSizeWrite)
          })
        end
        l_1_3 = l_1_3 + 1
      end
    end
    if 5 <= l_1_3 and 7 <= l_1_9 then
      local l_1_17 = {}
      l_1_17.file_paths = l_1_2
      l_1_17.bucket = l_1_5
      local l_1_18 = safeJsonSerialize(l_1_17)
      bm.add_related_string("geng_ransom_meta", l_1_18, bm.RelatedStringBMReport)
      if l_1_1 == 1 then
        bm.trigger_sig("GenericRansomware:FileAppendBucket1:16", l_1_18)
      elseif l_1_1 == 2 then
        bm.trigger_sig("GenericRansomware:FullFileFileOverwrite", l_1_18)
      end
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = {}
local l_0_6 = 0
local l_0_7 = 0
for l_0_8 = 1, l_0_0 do
  local l_0_9 = sigattr_tail[l_0_8].utf8p2
  if sigattr_tail[l_0_8].attribute == 16385 and sigattr_tail[l_0_8].utf8p1:byte(1) ~= 37 and l_0_9:find("TotalSizeAppend:0", 1, true) == nil then
    local l_0_10 = sigattr_tail[l_0_8].utf8p1:lower()
    local l_0_11 = l_0_10:match("%.[^%.]+$")
    if l_0_11 and mp.bitand(mp.GetExtensionClass(l_0_11), 3) ~= 0 then
      local l_0_12 = {}
      if l_0_1[l_0_10] == nil then
        l_0_1[l_0_10] = l_0_8
        for l_0_13, l_0_14 in string.gmatch(l_0_9, "(%w+):(%w+)") do
          l_0_12[l_0_13] = l_0_14
        end
        local l_0_15 = l_0_12.TotalSizeAppend and tonumber(l_0_12.TotalSizeAppend) or 0
        local l_0_16 = l_0_12.LastOff and tonumber(l_0_12.LastOff) or 0
        local l_0_17 = l_0_12.FirstOff and tonumber(l_0_12.FirstOff) or 0
        local l_0_18 = l_0_12.NumWrites and tonumber(l_0_12.NumWrites) or 0
        local l_0_19 = l_0_12.BiggestOff and tonumber(l_0_12.BiggestOff) or 0
        local l_0_20 = l_0_12.SmallestOff and tonumber(l_0_12.SmallestOff) or 0
        local l_0_21 = l_0_12.TotalSizeWrite and tonumber(l_0_12.TotalSizeWrite) or 0
        if l_0_15 <= 16 then
          if l_0_19 ~= 0 and l_0_17 == 0 and l_0_20 == 0 and l_0_19 == l_0_16 and l_0_16 + 1 == l_0_21 and 0 < l_0_18 and 0 < l_0_15 and l_0_15 <= 16 then
            l_0_12.path = l_0_10
            l_0_2[l_0_8] = l_0_12
            l_0_3 = l_0_3 + 1
          end
        else
          l_0_4 = l_0_4 + 1
        end
        if l_0_18 == 1 then
          if l_0_17 == 0 and l_0_20 == 0 and l_0_16 ~= 0 and l_0_16 == l_0_19 and l_0_19 + 1 == l_0_21 and l_0_21 == l_0_15 then
            l_0_12.path = l_0_10
            l_0_5[l_0_8] = l_0_12
            l_0_6 = l_0_6 + 1
          end
        else
          l_0_7 = l_0_7 + 1
        end
      end
    end
  end
end
local l_0_22 = mp.CLEAN
if l_0_4 == 0 and 10 <= l_0_3 then
  l_0_22 = reportGenEncryption(l_0_2, 1)
elseif l_0_7 == 0 and 10 <= l_0_6 then
  l_0_22 = reportGenEncryption(l_0_5, 2)
end
if l_0_22 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
