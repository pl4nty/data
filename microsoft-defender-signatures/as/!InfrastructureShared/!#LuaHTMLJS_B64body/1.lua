-- Threat: !InfrastructureShared
-- Name: !#Lua:HTML/JS_B64body
-- Type: 13
-- MpAttributes: SCRIPT:HTML/JS_B64body & SCRIPT:HasScriptTag.A & SCRIPT:StringBase64.A & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 100000 < l_0_0 or l_0_0 < 100 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.gsub(l_0_1, "src=\"data:text/javascript;base64,(.-)\">", function(l_1_0)
  return ">" .. MpCommon.Base64Decode(l_1_0)
end)
if 0 < #l_0_2 then
  mp.vfo_add_buffer(l_0_2, "[B64JavaScript]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  mp.set_mpattribute("//NScript:JSEnableEmulation")
  return mp.INFECTED
end
return mp.CLEAN
