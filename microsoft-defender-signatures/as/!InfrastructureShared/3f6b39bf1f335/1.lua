-- Threat: !InfrastructureShared
-- Name: 3f6b39bf1f335
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

bm.DisableSignature()
local l_0_0, l_0_1
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p2
end
if contains(l_0_0, "downloadstring") then
elseif contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if contains(l_0_1, "downloadstring") then
    l_0_0 = l_0_1
  end
else
  return mp.CLEAN
end
local l_0_2 = {
  "\\landesk\\ldclient\\ivanti-psmodule"
}
if contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {
  "iex",
  "invoke-expression"
}
if contains(l_0_0, l_0_3) then
  local l_0_4 = {
    "pastebin.com",
    "paste.ee",
    "j.mp",
    "textbin.net"
  }
  if contains(l_0_0, l_0_4) then
    if IsProcNameInParentProcessTree("BM", "wmiprvse.exe") then
      mp.TriggerScanResource("wmi", "")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
