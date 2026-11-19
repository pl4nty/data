-- Threat: !InfrastructureShared
-- Name: 5bb31753e001
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = bm.get_imagepath()
local l_0_1 = bm.get_current_process_startup_info()
if not (l_0_1 and l_0_1.command_line) or not l_0_0 then
  return mp.INFECTED
end
if StringEndsWith(l_0_0, "/bash") or StringEndsWith(l_0_0, "/dash") or StringEndsWith(l_0_0, "/sh") or StringEndsWith(l_0_0, "/perl") or StringEndsWith(l_0_0, "/ruby") or string.find(l_0_0, "/python", 1, true) or StringEndsWith(l_0_0, "/zsh") or StringEndsWith(l_0_0, "/csh") or StringEndsWith(l_0_0, "/ksh") or StringEndsWith(l_0_0, "/tcsh") then
  local l_0_2 = l_0_1.command_line
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
  if l_0_3 then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      if sysio.IsFileExists(l_0_5) then
        bm.add_related_file(l_0_5)
      end
    end
  end
end
return mp.INFECTED
