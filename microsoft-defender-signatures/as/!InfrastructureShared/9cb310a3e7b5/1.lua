-- Threat: !InfrastructureShared
-- Name: 9cb310a3e7b5
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[2].utf8p2))
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
    return mp.INFECTED
  end
end
if not this_sigattrlog[3].matched or this_sigattrlog[3].utf8p1 == nil then
  return mp.INFECTED
end
local l_0_1
l_0_1 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[3].utf8p1))
if not sysio.IsFileExists(l_0_1) then
  return mp.INFECTED
end
local l_0_2 = sysio.GetFileSize(l_0_1)
if not (100000 < l_0_2) or not (l_0_2 < 200000) then
  return mp.INFECTED
end
local l_0_3 = 50
local l_0_4 = sysio.ReadFile(l_0_1, 0, l_0_3)
if l_0_4 == nil then
  return mp.INFECTED
end
if #l_0_4 ~= l_0_3 then
  return mp.INFECTED
end
if l_0_4:match("[^\133-\212]") then
  return mp.INFECTED
end
l_0_0 = l_0_1
bm.add_related_file(l_0_0)
return mp.INFECTED
