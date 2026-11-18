-- Threat: !InfrastructureShared
-- Name: !#Lua:Lua:AMSI_Decoded
-- Type: 13
-- MpAttributes: MpPowershellAmsiViaCmdLine & MpIsPowerShellAMSIScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
if mp.get_mpattributesubstring("PACKED_WITH:") then
  return mp.CLEAN
end
if mp.get_mpattribute("ScriptObfuseScore") then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = tostring(headerpage):lower()
l_0_8, l_0_2 = string.gsub(l_0_8, "'%+'", "")
l_0_8, l_0_3 = string.gsub(l_0_8, "\"%+\"", "")
l_0_8, l_0_4 = string.gsub(l_0_8, "'%)%+%('", "")
l_0_8, l_0_5 = string.gsub(l_0_8, "\"%)%+%(\"", "")
l_0_8, l_0_6 = string.gsub(l_0_8, "`", "")
l_0_8, l_0_7 = string.gsub(l_0_8, "\"\"", "")
l_0_1 = l_0_2 + l_0_3 + l_0_4 + l_0_5 + l_0_6 + l_0_7
mp.set_mpattributeex("//ScriptObfuseScore", l_0_1)
if 500 <= l_0_1 then
  mp.set_mpattribute("Lua:HighScriptObfuseScore500")
elseif 400 < l_0_1 then
  mp.set_mpattribute("Lua:HighScriptObfuseScore400")
elseif 300 <= l_0_1 then
  mp.set_mpattribute("Lua:HighScriptObfuseScore300")
elseif 100 <= l_0_1 then
  mp.set_mpattribute("Lua:HighScriptObfuseScore100")
elseif 50 <= l_0_1 then
  mp.set_mpattribute("Lua:HighScriptObfuseScore50")
end
if 20 < l_0_1 then
  mp.vfo_add_buffer(l_0_8, "[SCRIPTAMSIDecoded]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.INFECTED
