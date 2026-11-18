-- Threat: !InfrastructureShared
-- Name: 136b30527bda4
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[6].matched then
  if this_sigattrlog[6].utf8p1 ~= nil then
    l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[6].utf8p1))
  end
  if this_sigattrlog[6].utf8p2 ~= nil then
    l_0_1 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[6].utf8p2))
  end
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_0:match("^(.*)%.exe")
if l_0_1:sub(1, #l_0_2) ~= l_0_2 then
  return mp.CLEAN
end
if l_0_1:sub(#l_0_2 + 1, #l_0_2 + 1) == " " then
  bm.add_related_string("path1", tostring(l_0_0), bm.RelatedStringBMReport)
  bm.add_related_string("path2", tostring(l_0_1), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
