-- Threat: !InfrastructureShared
-- Name: 3329c1d93b41
-- Type: 21
-- Includes: BMLuaLib

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") and not mp.get_mpattribute("MpIsRunDialogAmsiScan") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCRIPT:SuspClickfix.A") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 512 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetBruteMatchData()
local l_0_2 = ""
if l_0_1.is_header then
  l_0_2 = tostring(headerpage)
else
  l_0_2 = tostring(footerpage)
end
local l_0_3, l_0_4 = l_0_2:match("(%d+%.%d+%.%d+%.%d+):(%d+)")
if l_0_3 and l_0_4 then
  local l_0_6 = ({
    [8080] = true,
    [8000] = true,
    [8443] = true,
    [8888] = true
  })[l_0_4] ~= nil
  if l_0_6 then
    return mp.CLEAN
  end
  if isPublicIP(l_0_3) then
    return mp.INFECTED
  end
end
return mp.CLEAN
