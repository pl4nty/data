-- Threat: !InfrastructureShared
-- Name: 32b396c92bec
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil and l_0_1.ppid ~= nil then
  bm.trigger_sig(l_0_0, "FTPStoreParent", l_0_1.ppid)
end
return mp.INFECTED
