-- Threat: !InfrastructureShared
-- Name: 1b3d710060039
-- Type: 21
-- Includes: LuaFuncHelper, ResearchData, BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) then
  local l_0_1 = string.lower(l_0_0.image_path or "")
  if string.find(l_0_1, "\\windows\\sys", 1, true) and l_0_1:match("([^\\]+)$") == "iscsicpl.exe" then
    local l_0_2 = mp.GetParentProcInfo(l_0_0.ppid)
    if not isnull(l_0_2) and IsKeyInRollingQueue("iscsicpl_bypass", l_0_2.ppid, true) then
      local l_0_3 = mp.GetProcessCommandLine(l_0_2.ppid)
      if l_0_3 then
        set_research_data("PossibleTrigger", l_0_3, false)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
