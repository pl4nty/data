-- Threat: !InfrastructureShared
-- Name: 2c4d7ef6d9f22
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "psexesvc.exe" then
    return mp.INFECTED
  end
  local l_0_2 = MpCommon.GetOriginalFileName(l_0_1)
  if l_0_2 == "psexesvc.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
