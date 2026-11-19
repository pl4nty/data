-- Threat: !InfrastructureShared
-- Name: 60d79ac70697
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:match("([^\\]+)$")
  local l_0_3 = {
    ["node.exe"] = true,
    ["msbuild.exe"] = true,
    ["editbin.exe"] = true,
    ["link.exe"] = true,
    ["signtool.exe"] = true,
    ["symchk.exe"] = true,
    ["microsoft.servicehub.controller.exe"] = true,
    ["servicehub.host.node.x86.exe"] = true,
    ["servicehub.host.clr.exe"] = true,
    ["vs_installershell.exe"] = true,
    ["testhost.net472.x86.exe"] = true,
    ["symbolarchiveverifier.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.LOWFI
