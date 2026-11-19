-- Threat: !InfrastructureShared
-- Name: 4f0b3929bcb75
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[22].matched and this_sigattrlog[22].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[22].utf8p1
elseif this_sigattrlog[23].matched and this_sigattrlog[23].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[23].utf8p1
end
if l_0_0 ~= nil then
  taint(l_0_0, "remote_file_created_taint", 3600)
  bm.trigger_sig("SuspRemoteFileCopy", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
