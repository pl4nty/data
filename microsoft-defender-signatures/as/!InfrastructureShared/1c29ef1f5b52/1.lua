-- Threat: !InfrastructureShared
-- Name: 1c29ef1f5b52
-- Type: 21

if not mp.get_mpattribute("MpPowershellAmsiViaCmdLine") and not mp.get_mpattribute("MpIsRunDialogAmsiScan") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCRIPT:SuspSapsCmd.A") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 256 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetBruteMatchData()
local l_0_2 = ""
if l_0_1.is_header then
  l_0_2 = tostring(headerpage)
else
  l_0_2 = tostring(footerpage)
end
l_0_2 = string.lower(l_0_2)
l_0_2 = string.gsub(l_0_2, "%z", "")
l_0_2 = string.gsub(l_0_2, "%s+", " ")
l_0_2 = string.gsub(l_0_2, "'%+'", "")
l_0_2 = string.gsub(l_0_2, "'", "")
l_0_2 = string.gsub(l_0_2, "`", "")
l_0_2 = string.gsub(l_0_2, "%^", "")
if string.find(l_0_2, "http", 1, true) and string.find(l_0_2, "-w", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
