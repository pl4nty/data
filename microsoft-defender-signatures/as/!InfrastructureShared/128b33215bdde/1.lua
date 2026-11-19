-- Threat: !InfrastructureShared
-- Name: 128b33215bdde
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
end
bm.add_related_file(l_0_0)
local l_0_1 = {}
local l_0_2 = bm.get_current_process_startup_info()
l_0_1.image_path = l_0_0
l_0_1.friendly = MpCommon.IsFriendlyProcess(l_0_2.ppid)
l_0_1.parents, l_0_1.children = bm.get_process_relationships()
l_0_1.injection_relationship, l_0_1.injectors, l_0_1.injected = getCurrentProcessInjectors()
bm.add_related_string("TelemetryData", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
return mp.INFECTED
