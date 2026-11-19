-- Threat: !InfrastructureShared
-- Name: d6b3d4e158fe
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[4].matched then
  return mp.INFECTED
end
local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p2):lower()
end
local l_0_1 = {
  " -encode ",
  " -decode ",
  " -urlcache "
}
if not contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if contains(l_0_0, "takari regulatory") then
  return mp.CLEAN
end
if contains(l_0_0, "template master") then
  return mp.CLEAN
end
local l_0_2 = string.lower(bm.get_imagepath())
if contains(l_0_2, "outlook.exe") then
  return mp.CLEAN
end
if contains(l_0_2, "\\olk.exe") then
  return mp.CLEAN
end
local l_0_3 = {"OFFICE"}
local l_0_4 = {min = 1, max = 5}
if not QueryProcContext(l_0_3, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {"SCRIPTENG"}
local l_0_6 = {min = 1, max = 5}
if not QueryProcContext(l_0_5, l_0_6) then
  return mp.CLEAN
end
local l_0_7 = mp.GetExecutablesFromCommandLine(l_0_0)
if l_0_7 ~= nil then
  for l_0_8, l_0_9 in ipairs(l_0_7) do
    if l_0_9 ~= nil and l_0_9 ~= "" and sysio.IsFileExists(l_0_9) and not mp.IsKnownFriendlyFile(l_0_9, false, false) then
      bm.add_related_file(l_0_9)
    end
  end
end
return mp.INFECTED
