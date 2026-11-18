-- Threat: !InfrastructureShared
-- Name: 92b3d5c23c9c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  [".js"] = true
}
bm_AddRelatedFileFromCommandLine(l_0_0, l_0_1, nil, 1)
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_2 = this_sigattrlog[1].utf8p1
  local l_0_3 = string.match(l_0_2, "<Arguments>(.*)</Arguments>")
  local l_0_4 = string.match(l_0_2, "<WorkingDirectory>(.*)</WorkingDirectory>")
  if l_0_3 ~= nil then
    if l_0_3:find(":\\", 1, true) then
      bm_AddRelatedFileFromCommandLine(l_0_3, l_0_1, nil, 1)
    elseif l_0_4 ~= nil then
      bm_AddRelatedFileFromCommandLine(l_0_4 .. "\\" .. l_0_3, l_0_1, nil, 1)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
