-- Threat: !InfrastructureShared
-- Name: 15b3d475ad80
-- Type: 21

local l_0_0 = "%localappdata%\\Microsoft\\Edge\\User Data\\Default\\Extensions\\"
local l_0_1 = sysio.FindFiles(l_0_0, "manifest.json", -1)
for l_0_2, l_0_3 in pairs(l_0_1) do
  bm.add_related_file(l_0_3)
  bm.add_related_string("file", l_0_3, bm.RelatedStringBMReport)
  bm.add_related_string("file", l_0_3, bm.RelatedStringFileReport)
  if 10 < l_0_2 then
    break
  end
end
return mp.INFECTED
