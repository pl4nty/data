-- Threat: !InfrastructureShared
-- Name: 54d7c5568649
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "\\explorer.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
