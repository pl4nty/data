-- Threat: !InfrastructureShared
-- Name: 2ffb358b15e60
-- Type: 21

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(bm.get_imagepath())
  if l_0_0 == nil or 1 > string.len(l_0_0) then
    return mp.CLEAN
  end
  if string.find(l_0_0, "\\cmd.exe", 1, true) or string.find(l_0_0, "\\powershell.exe", 1, true) or string.find(l_0_0, "\\pwsh.exe", 1, true) or string.find(l_0_0, "\\powershell_ise.exe", 1, true) or string.find(l_0_0, "\\pangphip.exe", 1, true) or string.find(l_0_0, "\\log-agent.exe", 1, true) or string.find(l_0_0, "\\ossec-agent.exe", 1, true) or string.find(l_0_0, ":\\windows\\assembly\\", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
