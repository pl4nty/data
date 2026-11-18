-- Threat: !InfrastructureShared
-- Name: 53b3d720dfbe
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p1
local l_0_1 = {
  [".exe"] = true,
  [".dll"] = true
}
local l_0_2 = l_0_0:sub(-4)
if not l_0_1[l_0_2] then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_0) and mp.IsKnownFriendlyFile(l_0_0, false, false) == false then
  bm.add_related_file(l_0_0)
  local l_0_3 = {}
  table.insert(l_0_3, l_0_0)
  MpCommon.SetPersistContextNoPath("ServiceBinHijack", l_0_3, 3600)
  return mp.INFECTED
end
return mp.CLEAN
