-- Threat: !InfrastructureShared
-- Name: !#Lua:JsOnLoad
-- Type: 13
-- MpAttributes: SCRIPT:HTML/JsOnLoad & InEmail & (Html_file | Lua:HTMLExt | SCPT:HTMLFile)

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 20000 < l_0_0 or l_0_0 < 100 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "onload=\"([^\"]+)\">")
if l_0_2 ~= nil and 0 < #l_0_2 then
  mp.vfo_add_buffer(l_0_2, "[OnLoadJavaScript]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  mp.set_mpattribute("//NScript:JSEnableEmulation")
  return mp.INFECTED
end
return mp.CLEAN
