-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:JS/Bondat!CryptKeywords
-- Type: 13
-- Includes: BaseConversions
-- MpAttributes: Nscript:js_hasBigString & Nscript:js_hasNoIfs

local l_0_0 = mp.getfilesize()
if 92000 < l_0_0 or l_0_0 < 88000 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage) .. tostring(footerpage)
local l_0_2 = l_0_1:gmatch("%[([^%[%]]*[%+\\][^%[%]]*)%]%(")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.char

local function l_0_4(l_1_0)
  return l_0_3(tonumber(l_1_0, 16))
end

local function l_0_5(l_2_0)
  return l_0_3(tonumber(l_2_0, 8))
end

local l_0_6 = StrToBaseN
local l_0_7 = {
  prototype = "",
  constructor = "",
  fromCharCode = "",
  parseInt = "",
  split = "",
  length = "",
  Function = ""
}
for l_0_8 in l_0_2, nil, nil do
  local l_0_9 = l_0_8:gsub("\\x(..)", l_0_4):gsub("%((%d+)%)%.toString%((%d+)%)", l_0_6):gsub("([\"%+%s]+)", ""):gsub("\\(%d+)", l_0_5):gsub("\\", "")
  if l_0_7[l_0_9] then
    return mp.INFECTED
  end
end
return mp.CLEAN
