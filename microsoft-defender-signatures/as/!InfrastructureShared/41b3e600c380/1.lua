-- Threat: !InfrastructureShared
-- Name: 41b3e600c380
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "tiworker.exe", 1, true) or string.find(l_0_0, "dismhost.exe", 1, true) or string.find(l_0_0, "zscaler-windows", 1, true)) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[1].matched then
  if this_sigattrlog[1].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[1].utf8p2
  end
elseif this_sigattrlog[2].matched then
  if this_sigattrlog[2].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[2].utf8p2
  end
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p2
end
if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
  bm.add_related_file(l_0_1)
  MpCommon.AppendPersistContext(string.lower(l_0_1), "MasqSuspRenameTargetLowfi", 3600)
end
return mp.INFECTED
