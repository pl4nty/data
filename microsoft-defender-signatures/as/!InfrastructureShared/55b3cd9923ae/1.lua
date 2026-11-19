-- Threat: !InfrastructureShared
-- Name: 55b3cd9923ae
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
end
if this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4]
end
local l_0_2 = getMalwareManifest()
if l_0_2 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if l_0_0 == l_0_4 then
      return mp.INFECTED
    end
    if l_0_1 ~= nil then
      local l_0_5 = string.lower(l_0_1.utf8p1)
      if l_0_5 ~= nil and string.find(l_0_5, l_0_4, 1, true) then
        bm.add_related_file(l_0_4)
        return mp.INFECTED
      end
      local l_0_6 = string.lower(l_0_1.utf8p2)
      if string.find(l_0_6, l_0_4, 1, true) then
        bm.add_related_file(l_0_4)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
