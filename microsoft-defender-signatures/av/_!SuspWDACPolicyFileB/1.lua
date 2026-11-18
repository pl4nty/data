-- Threat: \xac!SuspWDACPolicyFile.B
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (Lua:CIPExt | Lua:P7BExt | SCPT:CIPolicy) & BM_POTENTIAL_ASN1_FILE

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2 = MpCommon.DecodeAsn1(l_0_1)
if not l_0_2 then
  return mp.CLEAN
end

local function l_0_3(l_1_0)
  local l_1_1 = {}
  for l_1_2 = 1, #l_1_0, 2 do
    l_1_1[#l_1_1 + 1] = string.char(tonumber(l_1_0:sub(l_1_2, l_1_2 + 1), 16))
  end
  return table.concat(l_1_1)
end

local function l_0_4(l_2_0, l_2_1, l_2_2, l_2_3)
  local l_2_4 = ""
  if l_2_3 > l_2_2 + 8 then
    local l_2_5 = l_2_2 + 1
    local l_2_6 = l_0_3(string.sub(l_2_0, l_2_5, l_2_5 + 8))
    local l_2_7 = mp.readu_u32(l_2_6, 1)
    l_2_2 = l_2_2 + 8
    if not (0 < l_2_7) then
      return "", l_2_2
    end
    local l_2_8 = mp.bitand(4 - l_2_7 % 4, 3)
    if l_2_3 > l_2_2 + l_2_7 * 2 then
      if l_2_1 then
        l_2_5 = l_2_2 + 1
        l_2_4 = l_0_3(string.sub(l_2_0, l_2_5, l_2_5 + l_2_7 * 2))
        if l_2_4 == nil then
          l_2_4 = ""
        end
      end
      l_2_2 = l_2_2 + (l_2_7 + l_2_8) * 2
    end
  end
  return l_2_4, l_2_2
end

local function l_0_5(l_3_0, l_3_1, l_3_2)
  local l_3_3 = ""
  if l_3_2 > l_3_1 + 8 then
    local l_3_4 = l_3_1 + 1
    local l_3_5 = l_0_3(string.sub(l_3_0, l_3_4, l_3_4 + 8))
    local l_3_6 = mp.readu_u32(l_3_5, 1)
    l_3_1 = l_3_1 + 8
    if not (0 < l_3_6) then
      l_3_1 = l_3_1 + 8
      return "", l_3_1
    end
    local l_3_7 = mp.bitand(4 - l_3_6 % 4, 3)
    if l_3_2 > l_3_1 + l_3_6 * 2 then
      l_3_4 = l_3_1 + 1
      l_3_3 = l_0_3(string.sub(l_3_0, l_3_4, l_3_4 + l_3_6 * 2))
      l_3_1 = l_3_1 + l_3_6 * 2
      if l_3_3 ~= nil then
        l_3_3 = string.gsub(l_3_3, "%z", "")
      end
    end
    l_3_1 = l_3_1 + (l_3_7 + 4) * 2
  end
  return l_3_3, l_3_1
end

local function l_0_6(l_4_0)
  local l_4_1 = string.len(l_4_0)
  local l_4_2 = l_0_3(string.sub(l_4_0, 1, 9))
  local l_4_3 = mp.readu_u32(l_4_2, 1)
  local l_4_4 = 81
  local l_4_5 = l_0_3(string.sub(l_4_0, l_4_4, l_4_4 + 8))
  local l_4_6 = mp.readu_u32(l_4_5, 1)
  l_4_4 = 89
  l_4_5 = l_0_3(string.sub(l_4_0, l_4_4, l_4_4 + 8))
  local l_4_7 = mp.readu_u32(l_4_5, 1)
  if l_4_7 == 0 then
    return false
  end
  if 300 < l_4_7 then
    return false
  end
  local l_4_8 = 136
  if 0 < l_4_6 then
    for l_4_9 = 1, l_4_6 do
      l_4_9, l_4_9, l_4_8 = pcall(l_0_4, l_4_0, false, l_4_8, l_4_1)
    end
  end
  local l_4_10 = {
    ["mssense.exe"] = true,
    ["msmpeng.exe"] = true,
    ["wdfilter.sys"] = true,
    ["wdnisdrv.sys"] = true,
    ["mssecflt.sys"] = true,
    ["msseccore.sys"] = true,
    ["mssecwfp.sys"] = true,
    ["mpcoredefenderservice.exe"] = true,
    ["senseir.exe"] = true
  }
  local l_4_11 = {}
  for l_4_12 = 1, l_4_7 do
    if l_4_1 >= l_4_8 + 8 then
      l_4_4 = l_4_8 + 1
      l_4_5 = l_0_3(string.sub(l_4_0, l_4_4, l_4_4 + 8))
      local l_4_13 = mp.readu_u32(l_4_5, 1)
      l_4_8 = l_4_8 + 8
      local l_4_14 = ""
      _, l_4_14, l_4_8 = pcall(l_0_5, l_4_0, l_4_8, l_4_1)
      if l_4_13 == 0 and l_4_10[string.lower(l_4_14)] then
        mp.set_mpattribute(string.format("MpInternal_researchdata=MDEFileDenied=%s", MpCommon.Base64Encode(l_4_14)))
        return true, "file"
      end
      l_4_8 = l_4_8 + 16
      local l_4_15 = ""
      _, l_4_15, l_4_8 = pcall(l_0_4, l_4_0, true, l_4_8, l_4_1)
      if 0 < #l_4_15 then
        local l_4_16 = ""
        for l_4_17 = 1, #l_4_15 do
          local l_4_18 = string.byte(l_4_15, l_4_17)
          l_4_16 = l_4_16 .. string.format("%02X ", l_4_18)
        end
      end
      if l_4_13 == 0 and l_4_14 == "" and l_4_15 == "" then
        l_4_11[l_4_12] = true
      end
    end
  end
  if l_4_3 ~= 7 or not next(l_4_11) then
    return false
  end
  local l_4_19 = 0
  l_4_8 = 136
  if l_4_1 - 136 < 8000 then
    l_4_19 = l_4_1 - 136
  else
    l_4_19 = 8000
    l_4_8 = l_4_1 - 8000
  end
  l_4_4 = l_4_8 + 1
  local l_4_20 = l_0_3(string.sub(l_4_0, l_4_4, l_4_4 + l_4_19))
  if l_4_20 == nil then
    return mp.CLEAN
  end
  local l_4_21 = "\006%z%z%z" .. ("."):rep(36) .. "\a%z%z%z"
  local l_4_22 = l_4_20:find(l_4_21)
  if l_4_22 == nil then
    return false
  end
  local l_4_23 = {
    ["c:\\programdata\\microsoft\\windows defender"] = true,
    ["c:\\programdata\\microsoft\\windows defender advanced threat protection"] = true,
    ["c:\\program files\\windows defender advanced threat protection"] = true,
    ["c:\\program files (x86)\\windows defender advanced threat protection"] = true,
    ["c:\\program files\\windows defender"] = true,
    ["c:\\program files (x86)\\windows defender"] = true,
    ["c:\\windows\\*"] = true,
    ["c:\\program files\\*"] = true,
    ["c:\\program files (x86)\\*"] = true
  }
  local l_4_24 = 1
  local l_4_25 = l_4_22 + 44
  while l_4_1 >= l_4_25 + 4 and l_4_7 >= l_4_24 do
    local l_4_26 = mp.readu_u32(l_4_20, l_4_25)
    l_4_25 = l_4_25 + 4
    local l_4_27 = ""
    local l_4_28 = mp.bitand(4 - l_4_26 % 4, 3)
    local l_4_29 = l_4_25
    if l_4_1 >= l_4_29 + l_4_26 then
      for l_4_30 = l_4_25, l_4_29 + l_4_26, 2 do
        local l_4_31 = mp.readu_u16(l_4_20, l_4_30)
        if l_4_31 ~= 0 then
          l_4_27 = l_4_27 .. string.char(l_4_31)
          l_4_25 = l_4_25 + 2
        end
      end
      l_4_25 = l_4_25 + l_4_28 + 4
      if l_4_23[string.lower(l_4_27)] and l_4_11[l_4_24] then
        local l_4_32 = MpCommon.NormalizeString(l_4_27, "CmdLineNormalizationStandard")
        mp.set_mpattribute(string.format("MpInternal_researchdata=MDEPathDenied=%s", MpCommon.Base64Encode(l_4_32)))
        return true, "path"
      end
    end
    l_4_24 = l_4_24 + 1
  end
  return false
end

local function l_0_7(l_5_0)
  if l_5_0.Type == "OCTET STRING" then
    local l_5_1 = string.sub(l_5_0.Value, 1, 8)
    if l_5_1 == "07000000" or l_5_1 == "06000000" or l_5_1 == "05000000" or l_5_1 == "04000000" or l_5_1 == "03000000" or l_5_1 == "02000000" or l_5_1 == "01000000" then
      return l_0_6(l_5_0.Value)
    end
  end
  if l_5_0.Children then
    for l_5_2, l_5_3 in ipairs(l_5_0.Children) do
      local l_5_4, l_5_5 = l_0_7(l_5_3)
      if l_5_4 then
        return true, l_5_5
      end
    end
  end
  return false
end

for l_0_8, l_0_9 in ipairs(l_0_2.Children) do
  local l_0_10, l_0_11 = l_0_7(l_0_9)
  if l_0_10 then
    if l_0_11 and l_0_11 == "file" then
      return mp.INFECTED
    else
      mp.changedetectionname(805306764)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
