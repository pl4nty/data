-- Threat: !InfrastructureShared
-- Name: 113b38ad79865
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if l_0_0.find(l_0_0, "\\clicktorun\\officeclicktorun.exe", 1, true) ~= nil then
    return mp.CLEAN
  end
end
local l_0_1, l_0_2
if this_sigattrlog[1].matched then
  if this_sigattrlog[1].utf8p2 ~= nil then
    local l_0_3 = this_sigattrlog[1].utf8p2
    if sysio.IsFileExists(l_0_3) then
      if mp.IsKnownFriendlyFile(l_0_3, true, false) == true then
        return mp.CLEAN
      end
      bm.add_related_file(l_0_3)
    end
  end
  if this_sigattrlog[1].utf8p1 ~= nil then
    l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
  end
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_1 ~= nil and l_0_2 ~= nil and string.find(l_0_1, l_0_2, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
