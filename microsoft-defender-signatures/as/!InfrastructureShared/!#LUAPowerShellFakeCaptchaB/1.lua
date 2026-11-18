-- Threat: !InfrastructureShared
-- Name: !#LUA:PowerShell/FakeCaptcha.B
-- Type: 13
-- MpAttributes: SCPT:HTML/FakeCaptcha.HF1

local l_0_0 = mp.getfilesize()
local l_0_1
if 2048 < l_0_0 then
  return mp.CLEAN
end
local l_0_2 = mp.GetNormalizedScript(true)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, "-replace'", 1, true) then
  local l_0_3 = l_0_2:match("replace%'(.-)%'")
  if l_0_3 ~= nil and #l_0_3 == 1 and l_0_3:match("[^%w%s]") then
    l_0_2 = l_0_2:gsub("%" .. l_0_3, "")
  end
end
l_0_2 = l_0_2:gsub("\"", "")
local l_0_4, l_0_5 = MpCommon.StringRegExpSearch("mshta([\\w.\\\"-]+)?http", l_0_2)
if l_0_4 == false then
  return mp.CLEAN
end
if string.find(l_0_2, "id", 1, true) and string.find(l_0_2, "#", 1, true) then
  return mp.INFECTED
end
if l_0_0 <= mp.HEADERPAGE_SZ then
  l_0_1 = tostring(headerpage)
else
  mp.readprotection(false)
  l_0_1 = tostring(mp.readfile(0, l_0_0))
  mp.readprotection(true)
end
if string.find(l_0_1, "\226\156\133", 1, true) or string.find(l_0_1, "\240\159\159\160", 1, true) or string.find(l_0_1, "\240\159\164\150", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
