-- Threat: !InfrastructureShared
-- Name: c4b32649a2ed
-- Type: 21

if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p1
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[2].utf8p2
if l_0_1 == nil then
  return mp.CLEAN
end

function get_appjs_path(l_1_0, l_1_1)
  local l_1_2 = l_1_0:match("(.+)\\[^\\]+$")
  if not l_1_2 then
    return nil
  end
  local l_1_3 = l_1_1:match("%.%\\([^%s\"']+)")
  if not l_1_3 then
    return nil
  end
  return l_1_2 .. "\\" .. l_1_3
end

local l_0_2 = get_appjs_path(l_0_0, l_0_1)
if l_0_2 ~= nil and sysio.IsFileExists(l_0_2) then
  bm.add_threat_file(l_0_2)
  bm.add_threat_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
