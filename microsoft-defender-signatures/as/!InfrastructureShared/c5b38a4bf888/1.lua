-- Threat: !InfrastructureShared
-- Name: c5b38a4bf888
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p1
if l_0_0 ~= nil and l_0_0 ~= "" and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 ~= nil and l_0_1.ppid ~= nil then
  MpCommon.TurnNriOnProcess(l_0_1.ppid)
end
return mp.INFECTED
