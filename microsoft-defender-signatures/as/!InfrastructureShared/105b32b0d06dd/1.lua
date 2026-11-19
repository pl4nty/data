-- Threat: !InfrastructureShared
-- Name: 105b32b0d06dd
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\windows\\system32\\MicrosoftEdgeSH.exe", 1, true) or string.find(l_0_0, "\\windows\\system32\\svchost.exe", 1, true) or string.find(l_0_0, "\\windows\\system32\\Windows.WARP.JITService.exe", 1, true) or string.find(l_0_0, "\\windows\\system32\\csrss.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
