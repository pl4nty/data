-- Threat: !InfrastructureShared
-- Name: 99d7c42c3c06
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "\\syswow64\\explorer.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.LOWFI
