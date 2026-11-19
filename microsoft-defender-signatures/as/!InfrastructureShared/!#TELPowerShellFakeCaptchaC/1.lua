-- Threat: !InfrastructureShared
-- Name: !#TEL:PowerShell/FakeCaptcha.C
-- Type: 13
-- MpAttributes: BM_ScriptFile & Nscript:Type_ps & SCPT:HTML/FakeCaptcha.HE2 & PowerShell:UseBasicParsing & (LUA:FileSizeLE100.A | LUA:FileSizeLE200.A)

local l_0_0 = mp.GetNormalizedScript(true)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1, l_0_2 = l_0_0:gsub("[%+']", "")
if l_0_2 < 10 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = MpCommon.StringRegExpSearch("https?://", l_0_1)
if l_0_3 == false then
  return mp.CLEAN
end
mp.vfo_add_buffer(l_0_1, "[StrDeObfus]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
if string.find(l_0_1, "|iex", 1, true) or string.find(l_0_1, "iex(", 1, true) or string.find(l_0_1, "invoke-", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
