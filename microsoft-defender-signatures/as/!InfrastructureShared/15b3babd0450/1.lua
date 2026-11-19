-- Threat: !InfrastructureShared
-- Name: 15b3babd0450
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = string.match(l_0_1, "(%a:\\[^\"]-%.ps1)")
if l_0_2 and sysio.IsFileExists(l_0_2) then
  mp.ReportLowfi(l_0_2, 1120308759)
  bm.add_related_file(l_0_2)
end
return mp.INFECTED
