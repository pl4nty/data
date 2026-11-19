-- Threat: !InfrastructureShared
-- Name: 96b313d85093
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
local l_0_1 = ".js"
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.gsub(l_0_0, "\\", "")
if string.byte(l_0_0) == string.byte("%") then
  if l_0_3 == nil or l_0_3 ~= 1 then
    return mp.CLEAN
  end
elseif l_0_3 == nil or l_0_3 ~= 3 then
  return mp.CLEAN
end
if string.lower(string.sub(l_0_0, -#l_0_1)) ~= l_0_1 then
  return mp.CLEAN
end
local l_0_4
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[1].utf8p2
end
if l_0_4 ~= nil then
  local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_4)
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    if string.find(string.lower(l_0_7), "\\javaw.exe") == nil and sysio.IsFileExists(l_0_7) then
      bm.add_threat_file(l_0_7)
    end
  end
end
return mp.INFECTED
