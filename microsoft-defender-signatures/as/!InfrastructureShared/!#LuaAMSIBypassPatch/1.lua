-- Threat: !InfrastructureShared
-- Name: !#Lua:AMSIBypass.Patch
-- Type: 13
-- MpAttributes: MpIsPowerShellAMSIScan

if not mp.get_mpattributesubstring("SCRIPT:AMSIBypass.Patch") and not mp.get_mpattributesubstring("SCRIPT:StrConcat!obfus") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 8192 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(tostring(headerpage))
local l_0_2 = 0
local l_0_3 = 0
l_0_1 = string.gsub(l_0_1, " ", "")
l_0_1 = string.gsub(l_0_1, "`", "")
l_0_1, l_0_3 = string.gsub(l_0_1, "%[char%](%d+)", function(l_1_0)
  return "'" .. string.char(l_1_0) .. "'"
end)
l_0_2 = l_0_2 + l_0_3
l_0_1, l_0_3 = string.gsub(l_0_1, "\"%+\"", "")
l_0_2 = l_0_2 + l_0_3
l_0_1, l_0_3 = string.gsub(l_0_1, "'%+'", "")
l_0_2 = l_0_2 + l_0_3
l_0_1 = string.gsub(l_0_1, "\"([%l%d]+)\"", "%1")
if l_0_2 < 2 then
  return mp.CLEAN
end
mp.vfo_add_buffer(l_0_1, "[StrConcat]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED
