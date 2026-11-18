-- Threat: !InfrastructureShared
-- Name: 49cb3983c7ae5
-- Type: 21

local l_0_0, l_0_1, l_0_2
local l_0_3 = 50000000
local l_0_4 = bm.GetSignatureMatchDuration()
if l_0_3 < l_0_4 then
  return mp.CLEAN
end
if this_sigattrlog[22].matched and this_sigattrlog[22].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[22].utf8p2
  l_0_1 = string.match(l_0_0, "/([^/]+)$")
  if not l_0_1 then
    return mp.CLEAN
  end
end
if this_sigattrlog[23].matched and this_sigattrlog[23].utf8p2 ~= nil then
  l_0_2 = this_sigattrlog[23].utf8p2
end
if l_0_2 ~= nil and (string.find(l_0_2, "insmod " .. l_0_1, 1, true) or string.find(l_0_2, "insmod " .. l_0_0, 1, true)) and string.find(l_0_1, ".ko", -3, true) then
  return mp.CLEAN
end
bm.add_related_string("DroppedKernelModule", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("KernelModuleLoadCmdLine", l_0_2, bm.RelatedStringBMReport)
mp.ReportLowfi(l_0_0, 1690978323)
return mp.INFECTED
