-- Threat: !InfrastructureShared
-- Name: 98b3a19be4c1
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
end
if l_0_1 == nil or l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_2 = extractDllForRegproc(l_0_0)
  if l_0_2 then
    if contains(l_0_1, l_0_2) then
      return mp.CLEAN
    end
    if checkFileLastWriteTime(l_0_2, 600) == false and mp.IsKnownFriendlyFile(l_0_2, true, false) == false then
      bm.add_related_file(l_0_2)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
