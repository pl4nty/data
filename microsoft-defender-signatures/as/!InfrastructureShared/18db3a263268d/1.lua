-- Threat: !InfrastructureShared
-- Name: 18db3a263268d
-- Type: 21

local l_0_0 = this_sigattrlog[3].utf8p2
local l_0_1 = ""
if l_0_0 ~= nil and l_0_0 ~= "" then
  l_0_1 = l_0_0
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
end
local l_0_2 = this_sigattrlog[4].utf8p2
if l_0_2 ~= nil and l_0_2 ~= "" then
  l_0_1 = l_0_1 .. "_" .. l_0_2
  if sysio.IsFileExists(l_0_2) then
    bm.add_related_file(l_0_2)
  end
end
if l_0_1 ~= "" then
  bm.add_related_string("ComHijackValues", l_0_1, bm.RelatedStringBMReport)
end
return mp.INFECTED
