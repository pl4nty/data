-- Threat: !InfrastructureShared
-- Name: 17ab3f4554db9
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
end
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.gsub(l_0_0, "\\", "")
if string.byte(l_0_0) == string.byte("%") then
  if l_0_2 == nil or l_0_2 ~= 2 then
    return mp.CLEAN
  end
elseif l_0_2 == nil or l_0_2 ~= 4 then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[1].utf8p2
end
if l_0_3 ~= nil then
  local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_3)
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    if string.find(string.lower(l_0_6), "\\javaw.exe") == nil and sysio.IsFileExists(l_0_6) then
      bm.add_threat_file(l_0_6)
    end
  end
end
return mp.INFECTED
