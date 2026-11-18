-- Threat: !InfrastructureShared
-- Name: 2229b69dc66f
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if not mp.get_mpattribute("RPF:TopLevelFile") and not mp.get_mpattribute("MpOnOpenOrCloseRtpScan") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCRIPT:FuncObfusHex.A") then
  return mp.CLEAN
end
if mp.getfilesize() > 12288 then
  return mp.CLEAN
end
local r0_0 = mp.GetBruteMatchData()
local r0_1 = ""
local r0_2
if r0_0.is_header then
  local r0_3 = tostring(headerpage)
  r0_2 = r0_3
else
  local r0_4 = tostring(footerpage)
  r0_2 = r0_4
end
local r0_5 = string.lower(r0_2)
r0_2 = r0_5
r0_5 = 0
local r0_6, r0_7, r0_8 = select, 2, r0_2
r0_6 = r0_6(r0_7, r0_8:gsub("function _0x%w+", ""))
r0_5 = r0_5 + r0_6
r0_6 = select
r0_7 = 2
r0_8 = r0_2
r0_6 = r0_6(r0_7, r0_8:gsub("let _0x%w+", ""))
r0_5 = r0_5 + r0_6
r0_6 = select
r0_7 = 2
r0_8 = r0_2
r0_6 = r0_6(r0_7, r0_8:gsub("const _0x%w+", ""))
r0_5 = r0_5 + r0_6
r0_6 = select
r0_7 = 2
r0_8 = r0_2
r0_6 = r0_6(r0_7, r0_8:gsub("return _0x%w+;", ""))
r0_5 = r0_5 + r0_6
r0_6 = select
r0_7 = 2
r0_8 = r0_2
r0_6 = r0_6(r0_7, r0_8:gsub(" _0x%w+%.%a+%(", ""))
if r0_5 + r0_6 >= 10 then
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
  return mp.INFECTED
end
return mp.CLEAN
