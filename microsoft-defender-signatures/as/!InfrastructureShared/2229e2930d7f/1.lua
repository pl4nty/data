-- Threat: !InfrastructureShared
-- Name: 2229e2930d7f
-- Type: 21

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") and not mp.get_mpattribute("MpIsRunDialogAmsiScan") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCRIPT:SuspClickfix.A") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 528 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, ";&(g", 1, true) or string.find(l_0_1, ";&$", 1, true) or string.find(l_0_1, ";&($", 1, true) or string.find(l_0_1, "getbytes($", 1, true) or string.find(l_0_1, "|powershell", 1, true) or string.find(l_0_1, "iex $", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
