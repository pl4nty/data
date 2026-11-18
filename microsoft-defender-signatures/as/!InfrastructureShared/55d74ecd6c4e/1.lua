-- Threat: !InfrastructureShared
-- Name: 55d74ecd6c4e
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:find("\\powershell.exe") then
    local l_0_2 = mp.GetProcessCommandLine(l_0_0.ppid)
    if l_0_2 ~= nil then
      l_0_2 = string.lower(l_0_2)
      if l_0_2:find("iex", 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
