-- Threat: !InfrastructureShared
-- Name: ebb3cfb24c8b
-- Type: 21

local l_0_0
local l_0_1 = 0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    l_0_4 = string.lower(l_0_4)
    if string.find(l_0_4, "programdata", 1, true) == nil then
      return mp.CLEAN
    elseif string.find(l_0_4, "program files", 1, true) == nil then
      return mp.CLEAN
    elseif string.find(l_0_4, "\\windowsazure\\.-\\waappagent.exe") == nil then
      return mp.CLEAN
    elseif string.find(l_0_4, "\\windowsazure.-\\windowsazurenetagent.exe") == nil then
      return mp.CLEAN
    elseif string.find(l_0_4, "c:\\progra~", 1, true) == nil then
      return mp.CLEAN
    elseif string.find(l_0_4, "\\windows\\", 1, true) then
      if string.find(l_0_4, "windows\\system", 1, true) == nil then
        return mp.CLEAN
      elseif string.find(l_0_4, "\\syswow64", 1, true) == nil then
        return mp.CLEAN
      elseif string.find(l_0_4, "\\assembly\\nativeimages", 1, true) == nil then
        return mp.CLEAN
      elseif string.find(l_0_4, "\\winsxs", 1, true) == nil then
        return mp.CLEAN
      elseif string.find(l_0_4, "\\servicing", 1, true) == nil then
        return mp.CLEAN
      end
    end
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
      l_0_1 = l_0_1 + 1
    end
  end
end
if 0 < l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
