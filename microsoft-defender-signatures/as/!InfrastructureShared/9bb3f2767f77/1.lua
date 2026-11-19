-- Threat: !InfrastructureShared
-- Name: 9bb3f2767f77
-- Type: 21

local l_0_0, l_0_1, l_0_2
local l_0_3 = string.lower(bm.get_imagepath())
if l_0_3:find("explorer.exe") then
  l_0_0 = string.match(this_sigattrlog[1].utf8p2, ".exe")
  if l_0_0 ~= nil then
    l_0_0 = this_sigattrlog[1].utf8p2
    l_0_1 = this_sigattrlog[2].utf8p2
    l_0_2 = this_sigattrlog[3].utf8p1
    if l_0_0 == l_0_1 and l_0_0 == l_0_2 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
