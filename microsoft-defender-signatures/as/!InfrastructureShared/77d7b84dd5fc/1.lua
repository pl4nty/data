-- Threat: !InfrastructureShared
-- Name: 77d7b84dd5fc
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "powershell.exe" then
    return mp.INFECTED
  end
  local l_0_2 = MpCommon.GetOriginalFileName(l_0_1)
  if l_0_2 == "powershell.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
