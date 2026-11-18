-- Threat: !InfrastructureShared
-- Name: 11ad73ef595e9
-- Type: 21
-- Flags: 1

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "\\programdata\\microsoft\\azurewatson\\0\\awdumpifeo.exe", 1, true) or string.find(l_0_1, "\\windows\\system32\\werfault.exe", 1, true) or string.find(l_0_1, "\\windows\\syswow64\\werfault.exe", 1, true) then
    return mp.CLEAN
  end
end
return mp.SUSPICIOUS
