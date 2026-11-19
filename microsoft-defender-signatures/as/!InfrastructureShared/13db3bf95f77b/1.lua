-- Threat: !InfrastructureShared
-- Name: 13db3bf95f77b
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = 0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1) or ""
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
  l_0_1 = string.lower(this_sigattrlog[3].utf8p1) or ""
end
l_0_1 = l_0_1:match("\\services\\(.-)\\\\")
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1:find("^aarsvc_") then
  return mp.CLEAN
end
if l_0_1:find("^mpksl") then
  return mp.CLEAN
end
if l_0_1:find("^procexp") then
  return mp.CLEAN
end
local l_0_3 = "|googlechromeelevationservice|microsoftedgeelevationservice|onedrive updater service|windowsazureguestagent|"
if l_0_3:find(l_0_1, 1, true) then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
    if string.find(l_0_6, "c:\\programdata", 1, true) then
      return mp.CLEAN
    elseif string.find(l_0_6, "c:\\program files", 1, true) then
      return mp.CLEAN
    elseif string.find(l_0_6, "c:\\progra~", 1, true) then
      return mp.CLEAN
    elseif string.find(l_0_6, "c:\\windowsazure\\", 1, true) then
      return mp.CLEAN
    elseif string.find(l_0_6, "c:\\windows\\", 1, true) then
      if string.find(l_0_6, "c:\\windows\\system", 1, true) then
        return mp.CLEAN
      elseif string.find(l_0_6, "c:\\windows\\syswow64", 1, true) then
        return mp.CLEAN
      elseif string.find(l_0_6, "\\assembly\\nativeimages", 1, true) then
        return mp.CLEAN
      elseif string.find(l_0_6, "\\winsxs", 1, true) then
        return mp.CLEAN
      elseif string.find(l_0_6, "\\servicing", 1, true) then
        return mp.CLEAN
      end
    end
    if sysio.IsFileExists(l_0_6) then
      bm.add_related_file(l_0_6)
      l_0_2 = l_0_2 + 1
    end
  end
end
local l_0_7 = MpCommon.GetPersistContextNoPath("ServiceCreationScript")
if l_0_7 then
  for l_0_8, l_0_9 in ipairs(l_0_7) do
    if sysio.IsFileExists(l_0_9) then
      bm.add_related_file(l_0_9)
    end
  end
end
if 0 < l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
