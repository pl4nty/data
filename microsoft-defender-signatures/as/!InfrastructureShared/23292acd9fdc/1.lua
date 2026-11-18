-- Threat: !InfrastructureShared
-- Name: 23292acd9fdc
-- Type: 21

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
local l_0_1 = tostring(headerpage)
local l_0_2, l_0_3 = l_0_1:match("%.Replace%('([^']*)','([^']*)'%)")
l_0_1 = string.gsub(l_0_1, l_0_2, l_0_3)
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "iex(irm ", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
