-- Threat: !InfrastructureShared
-- Name: f1d744349771
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) then
  local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
  if not isnull(l_0_1) then
    l_0_1 = string.lower(l_0_1)
    local l_0_2 = {
      "invoke-webrequest",
      "invoke-expression",
      "| invoke-expression",
      "|iex",
      "| iex",
      "iwr "
    }
    if contains(l_0_1, l_0_2) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
