-- Threat: !InfrastructureShared
-- Name: 4d5b3d034362c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and next(l_0_0) and l_0_0.command_line then
  local l_0_1 = string.lower(l_0_0.command_line)
  bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
  bm.add_related_string("[i] Sus cmdline: ", l_0_1, bm.RelatedStringBMReport)
  bm.add_related_file(l_0_1)
end
return mp.INFECTED
