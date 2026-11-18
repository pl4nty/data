-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:VBS/AdodbStreamInChrw
-- Type: 13
-- MpAttributes: SCPT:VBS/CreateOjbectStringInChrw

local l_0_0 = mp.getfilesize()
if l_0_0 < 65536 or 983040 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_1:match("const%s%a%a%a%a-%s=%s1.-=%s-createobject%((.-)%)%s-%a%a%a%a-.type")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  "A",
  "D",
  "O",
  "D",
  "B",
  ".",
  "S",
  "t",
  "r",
  "e",
  "a",
  "m"
}

local function l_0_4(l_1_0, l_1_1)
  return l_1_0 + l_1_1
end

local l_0_5 = {}
local l_0_6 = 1
for l_0_7, l_0_8 in string.gmatch(l_0_2, "chrw%((%d-)+(%d-)%)") do
  local l_0_9 = l_0_4(l_0_7, l_0_8)
  l_0_5[l_0_6] = string.char(l_0_9)
  if l_0_5[l_0_6] ~= l_0_3[l_0_6] then
    return mp.CLEAN
  end
  l_0_6 = l_0_6 + 1
end
return mp.INFECTED
