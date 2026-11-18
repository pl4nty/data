-- Threat: !InfrastructureShared
-- Name: 79d7ea05d0c1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = mp.GetScannedPPID()
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = mp.GetProcessCommandLine(l_0_1):lower()
  if l_0_0.image_path ~= nil then
    local l_0_3 = string.lower(l_0_0.image_path)
    if l_0_3:match("([^\\]+)$") == "explorer.exe" then
      return mp.INFECTED
    end
  end
  local l_0_4 = {"hidden"}
  if not contains(l_0_2, l_0_4) then
    return mp.CLEAN
  end
end
return mp.INFECTED
