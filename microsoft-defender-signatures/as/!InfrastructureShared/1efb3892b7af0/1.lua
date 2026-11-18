-- Threat: !InfrastructureShared
-- Name: 1efb3892b7af0
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
local l_0_2, l_0_3
if this_sigattrlog[4].matched and this_sigattrlog[6].matched then
  l_0_2 = string.lower(this_sigattrlog[4].utf8p1)
  l_0_3 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[7].matched then
  l_0_2 = string.lower(this_sigattrlog[5].utf8p1)
  l_0_3 = string.lower(this_sigattrlog[7].utf8p2)
end
if l_0_2 ~= nil and l_0_3 ~= nil then
  local l_0_4, l_0_5 = l_0_2:match("([^\\]-([^%.]+))$")
  local l_0_6 = l_0_4:sub(1, 2)
  if l_0_0[l_0_5] and l_0_1[l_0_6] then
    l_0_3 = string.match(l_0_3, "\\([^\\]+)$")
    if l_0_4 == l_0_3 then
      mp.ReportLowfi(mp.ContextualExpandEnvironmentVariables(l_0_2), 4091961331)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
