-- Threat: \xac!SuspWDACPolicyFile.C
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (Lua:CIPExt | Lua:P7BExt | SCPT:CIPolicy)

local function l_0_0(l_1_0, l_1_1, l_1_2)
  local l_1_3 = ""
  
  if l_1_2 > l_1_1 + 4 then
    local l_1_4 = mp.readu_u32(mp.readfile(l_1_1, 4), 1)
    l_1_1 = l_1_1 + 4
    if not (0 < l_1_4) then
      return "", l_1_1
    end
    local l_1_5 = mp.bitand(4 - l_1_4 % 4, 3)
    if l_1_2 > l_1_1 + l_1_4 then
      if l_1_0 then
        l_1_3 = mp.readfile(l_1_1, l_1_4)
        if l_1_3 == nil then
          l_1_3 = ""
        end
      end
      l_1_1 = l_1_1 + l_1_4 + l_1_5
    end
  end
  return l_1_3, l_1_1
end

local function l_0_1(l_2_0, l_2_1)
  local l_2_2 = ""
  if l_2_1 > l_2_0 + 4 then
    local l_2_3 = mp.readu_u32(mp.readfile(l_2_0, 4), 1)
    l_2_0 = l_2_0 + 4
    if not (0 < l_2_3) then
      l_2_0 = l_2_0 + 4
      return "", l_2_0
    end
    local l_2_4 = mp.bitand(4 - l_2_3 % 4, 3)
    if l_2_1 > l_2_0 + l_2_3 then
      l_2_2 = mp.readfile(l_2_0, l_2_3)
      l_2_0 = l_2_0 + l_2_3
      if l_2_2 ~= nil then
        l_2_2 = string.gsub(l_2_2, "%z", "")
      end
    end
    l_2_0 = l_2_0 + l_2_4 + 4
  end
  return l_2_2, l_2_0
end

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if l_0_2 < 68 then
  return mp.CLEAN
end
if 1048576 < l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.readu_u32(headerpage, 1)
local l_0_4 = mp.readu_u32(headerpage, 41)
local l_0_5 = mp.readu_u32(headerpage, 45)
if l_0_5 <= 0 then
  return mp.CLEAN
end
if 300 < l_0_5 then
  return mp.CLEAN
end
local l_0_6 = 68
mp.readprotection(false)
if 0 < l_0_4 then
  for l_0_7 = 1, l_0_4 do
    l_0_7, l_0_6 = l_0_0(false, l_0_6, l_0_2)
  end
end
local l_0_8 = {
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
local l_0_9 = false
local l_0_10 = {}
for l_0_11 = 1, l_0_5 do
  if l_0_2 >= l_0_6 + 4 then
    local l_0_12 = mp.readu_u32(mp.readfile(l_0_6, 4), 1)
    l_0_6 = l_0_6 + 4
    local l_0_13 = ""
    l_0_13, l_0_6 = l_0_1(l_0_6, l_0_2)
    if l_0_12 == 0 and l_0_8[string.lower(l_0_13)] then
      mp.set_mpattribute(string.format("MpInternal_researchdata=MDEFileDenied=%s", MpCommon.Base64Encode(l_0_13)))
      return mp.INFECTED
    end
    l_0_6 = l_0_6 + 8
    local l_0_14 = ""
    l_0_14, l_0_6 = l_0_0(true, l_0_6, l_0_2)
    if l_0_12 == 0 and l_0_13 == "" and l_0_14 == "" then
      l_0_9 = true
      l_0_10[l_0_11] = true
    end
  end
end
if l_0_9 == false or l_0_3 ~= 7 then
  return mp.CLEAN
end
local l_0_15 = 0
l_0_6 = 68
if l_0_2 - 68 < 4000 then
  l_0_15 = l_0_2 - 68
else
  l_0_15 = 4000
  l_0_6 = l_0_2 - 4000
end
local l_0_16 = mp.readfile(l_0_6, l_0_15)
if l_0_16 == nil then
  return mp.CLEAN
end
local l_0_17 = "\006%z%z%z" .. ("."):rep(36) .. "\a%z%z%z"
local l_0_18 = l_0_16:find(l_0_17)
if l_0_18 == nil then
  return mp.CLEAN
end
local l_0_19 = {
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
local l_0_20 = 1
local l_0_21 = l_0_18 + 44
while l_0_2 >= l_0_21 + 4 and l_0_5 >= l_0_20 do
  local l_0_22 = mp.readu_u32(l_0_16, l_0_21)
  l_0_21 = l_0_21 + 4
  local l_0_23 = ""
  local l_0_24 = mp.bitand(4 - l_0_22 % 4, 3)
  local l_0_25 = l_0_21
  if l_0_2 >= l_0_25 + l_0_22 then
    for l_0_26 = l_0_21, l_0_25 + l_0_22, 2 do
      local l_0_27 = mp.readu_u16(l_0_16, l_0_26)
      if l_0_27 ~= 0 then
        l_0_23 = l_0_23 .. string.char(l_0_27)
        l_0_21 = l_0_21 + 2
      end
    end
    l_0_21 = l_0_21 + l_0_24 + 4
    if l_0_19[string.lower(l_0_23)] and l_0_10[l_0_20] then
      local l_0_28 = MpCommon.NormalizeString(l_0_23, "CmdLineNormalizationStandard")
      mp.set_mpattribute(string.format("MpInternal_researchdata=MDEPathDenied=%s", MpCommon.Base64Encode(l_0_28)))
      mp.changedetectionname(805306763)
      return mp.INFECTED
    end
  end
  l_0_20 = l_0_20 + 1
end
return mp.CLEAN
