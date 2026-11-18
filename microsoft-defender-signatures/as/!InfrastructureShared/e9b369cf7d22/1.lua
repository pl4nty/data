-- Threat: !InfrastructureShared
-- Name: e9b369cf7d22
-- Type: 21

local l_0_0 = {
  exe = "",
  cmd = "",
  bat = "",
  com = "",
  pif = "",
  scr = ""
}
local l_0_1 = {ms = "", cc = ""}
local l_0_2
if this_sigattrlog[1].matched then
  l_0_2 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_2 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_2 ~= nil then
  local l_0_3, l_0_4 = l_0_2:match("([^\\]-([^%.]+))$")
  local l_0_5 = l_0_3:sub(1, 2)
  if l_0_0[l_0_4] and l_0_1[l_0_5] then
    return mp.INFECTED
  end
end
return mp.CLEAN
