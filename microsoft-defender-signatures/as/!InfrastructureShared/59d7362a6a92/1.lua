-- Threat: !InfrastructureShared
-- Name: 59d7362a6a92
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, ":\\Windows\\system32\\cscript.exe", 2, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
