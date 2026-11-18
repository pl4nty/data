-- Threat: \xac!SuspWDACPolicyFile.A
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & BM_POTENTIAL_WDAC_POLICY_FILE & LUA:FileSizeLE1M.B & !(Lua:CIPExt | Lua:P7BExt | SCPT:CIPolicy)

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
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3 = {
  "SecurityPackStartup.exe",
  "pg_basebackup.exe"
}
if contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
  "Windows\\System32\\CodeIntegrity\\SiPolicy.p7b"
}
local l_0_5 = mp.getfilename()
if l_0_5 and contains(l_0_5, l_0_4) then
  return mp.CLEAN
end
local l_0_6 = mp.getfilesize()
if l_0_6 < 68 then
  return mp.CLEAN
end
if 1048576 < l_0_6 then
  return mp.CLEAN
end
local l_0_7 = mp.readu_u32(headerpage, 1)
local l_0_8 = mp.readu_u32(headerpage, 41)
local l_0_9 = mp.readu_u32(headerpage, 45)
if l_0_9 <= 0 then
  return mp.CLEAN
end
if 300 < l_0_9 then
  return mp.CLEAN
end
local l_0_10 = 68
mp.readprotection(false)
if 0 < l_0_8 then
  for l_0_11 = 1, l_0_8 do
    l_0_11, l_0_10 = l_0_0(false, l_0_10, l_0_6)
  end
end
local l_0_12 = {
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
local l_0_13 = false
local l_0_14 = {}
for l_0_15 = 1, l_0_9 do
  if l_0_6 >= l_0_10 + 4 then
    local l_0_16 = mp.readu_u32(mp.readfile(l_0_10, 4), 1)
    l_0_10 = l_0_10 + 4
    local l_0_17 = ""
    l_0_17, l_0_10 = l_0_1(l_0_10, l_0_6)
    if l_0_16 == 0 and l_0_12[string.lower(l_0_17)] then
      mp.set_mpattribute(string.format("MpInternal_researchdata=MDEFileDenied=%s", MpCommon.Base64Encode(l_0_17)))
      return mp.INFECTED
    end
    l_0_10 = l_0_10 + 8
    local l_0_18 = ""
    l_0_18, l_0_10 = l_0_0(true, l_0_10, l_0_6)
    if l_0_16 == 0 and l_0_17 == "" and l_0_18 == "" then
      l_0_13 = true
      l_0_14[l_0_15] = true
    end
  end
end
if l_0_13 == false or l_0_7 ~= 7 then
  return mp.CLEAN
end
local l_0_19 = 0
l_0_10 = 68
if l_0_6 - 68 < 4000 then
  l_0_19 = l_0_6 - 68
else
  l_0_19 = 4000
  l_0_10 = l_0_6 - 4000
end
local l_0_20 = mp.readfile(l_0_10, l_0_19)
if l_0_20 == nil then
  return mp.CLEAN
end
local l_0_21 = "\006%z%z%z" .. ("."):rep(36) .. "\a%z%z%z"
local l_0_22 = l_0_20:find(l_0_21)
if l_0_22 == nil then
  return mp.CLEAN
end
local l_0_23 = {
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
local l_0_24 = 1
local l_0_25 = l_0_22 + 44
while l_0_6 >= l_0_25 + 4 and l_0_9 >= l_0_24 do
  local l_0_26 = mp.readu_u32(l_0_20, l_0_25)
  l_0_25 = l_0_25 + 4
  local l_0_27 = ""
  local l_0_28 = mp.bitand(4 - l_0_26 % 4, 3)
  local l_0_29 = l_0_25
  if l_0_6 >= l_0_29 + l_0_26 then
    for l_0_30 = l_0_25, l_0_29 + l_0_26, 2 do
      local l_0_31 = mp.readu_u16(l_0_20, l_0_30)
      if l_0_31 ~= 0 then
        l_0_27 = l_0_27 .. string.char(l_0_31)
        l_0_25 = l_0_25 + 2
      end
    end
    l_0_25 = l_0_25 + l_0_28 + 4
    if l_0_23[string.lower(l_0_27)] and l_0_14[l_0_24] then
      local l_0_32 = MpCommon.NormalizeString(l_0_27, "CmdLineNormalizationStandard")
      mp.set_mpattribute(string.format("MpInternal_researchdata=MDEPathDenied=%s", MpCommon.Base64Encode(l_0_32)))
      mp.changedetectionname(805306763)
      return mp.INFECTED
    end
  end
  l_0_24 = l_0_24 + 1
end
return mp.CLEAN
