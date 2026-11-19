-- Threat: !InfrastructureShared
-- Name: 9cb3931a67d1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2:lower()
end
local l_0_1 = {
  "execute remote test passed",
  "psscript_output_",
  "cloudamize_host_share",
  "instance-identity",
  "import-module hyper-v",
  "applicationhost.config",
  "iaa7acaacgbhaguadaatafcaaqbuaeua",
  "cgbjag4adgbvagsazqatafiazqbzahqatqblahqaaabvagq",
  "collectomsagentstatus",
  "temp\\nessus_",
  "audit_windows.vbs",
  "epascanner64.cab",
  "hidetableheaders",
  "usb insert.ps1",
  "execute remote test passed",
  "writedellwarranty",
  "conda.bat"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if contains(l_0_0, "cmd.*/c", false) and contains(l_0_0, {
  " powershell"
}) then
  bm.add_related_string("WmiprvseRemoteProc", l_0_0, bm.RelatedStringBMReport)
  reportSessionInformation()
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
