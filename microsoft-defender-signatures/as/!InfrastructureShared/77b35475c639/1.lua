-- Threat: !InfrastructureShared
-- Name: 77b35475c639
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
if string.find(l_0_0, "\\node_modules\\", 1, true) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_1, "\\electron\\dist\\", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_0, "\\resources\\", 1, true)
if l_0_2 and 1 < l_0_2 then
  local l_0_3 = string.sub(l_0_0, 1, l_0_2 - 1)
  if string.sub(l_0_1, 1, #l_0_3) == l_0_3 then
    return mp.CLEAN
  end
end
if mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
TrackPidAndTechniqueBM("BM", "T1218.015", "SuspElectronNodeLoad")
return mp.INFECTED
