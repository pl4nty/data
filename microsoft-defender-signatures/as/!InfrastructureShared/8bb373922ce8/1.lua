-- Threat: !InfrastructureShared
-- Name: 8bb373922ce8
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), true, true) == true then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0:find("\\windowsazure\\.-\\waappagent.exe") then
  return mp.CLEAN
elseif l_0_0:find("\\windowsazure.-\\windowsazurenetagent.exe") then
  return mp.CLEAN
elseif l_0_0:find("system32\\drivers\\mbamswissarmy.sys") then
  return mp.CLEAN
elseif l_0_0:find("symantec shared\\eengine\\eraserutildrv11821.sys") then
  return mp.CLEAN
elseif l_0_0:find("system32\\drivers\\kbasemgr.sys") then
  return mp.CLEAN
elseif l_0_0:find("system32\\drivers\\kisknl.sys") then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
