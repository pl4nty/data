-- Threat: !InfrastructureShared
-- Name: ebb36743e531
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -7) == "cmd.exe" or string.sub(l_0_0, -12) == "explorer.exe" or string.sub(l_0_0, -14) == "powershell.exe" or string.sub(l_0_0, -12) == "mpcmdrun.exe" then
  return mp.CLEAN
end
return mp.INFECTED
