-- Threat: !InfrastructureShared
-- Name: 39b3af471b8d
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
else
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.match(l_0_1, "[/-]e:([%a]+)")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {
  jscript = ".js",
  javascript = ".js",
  vbscript = ".vbs",
  vbs = ".vbs"
}
local l_0_4 = l_0_3[l_0_2]
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_1)
for l_0_6, l_0_7 in ipairs(l_0_5) do
  local l_0_8 = string.match(l_0_7, "(%.[^%.]+)$")
  if l_0_8 ~= l_0_4 then
    local l_0_9 = string.lower(string.match(l_0_7, "([^\\]+)$"))
    if l_0_9 ~= "wscript.exe" and l_0_9 ~= "cscript.exe" and not l_0_9.find("capainstaller", 1, true) and sysio.IsFileExists(l_0_7) and not mp.IsKnownFriendlyFile(l_0_7, false, false) then
      mp.ReportLowfi(l_0_7, 4091252919)
    end
  end
end
return mp.CLEAN
