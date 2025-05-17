-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\131b35c69f265\1_luac 

-- params : ...
-- function num : 0
if (versioning.GetEngineBuild)() < 16700 then
  return mp.CLEAN
end
local l_0_0 = (versioning.GetOrgID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = false
if l_0_0 == "d7c7c745-195f-4223-9c7a-99fb420fd000" or l_0_0 == "c34db763-35fc-4c4a-9ca4-697338808f18" then
  l_0_1 = true
else
  if (MpCommon.IsSampled)(20000, false, true, true) == true then
    l_0_1 = true
  end
end
if l_0_1 == false then
  return mp.CLEAN
end
if not (mp.IsHipsRuleEnabled)("9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2") then
  return mp.CLEAN
end
local l_0_2, l_0_3 = nil, nil
if (this_sigattrlog[1]).matched then
  l_0_2 = (this_sigattrlog[1]).ppid
  l_0_3 = (this_sigattrlog[1]).utf8p2
else
  if (this_sigattrlog[2]).matched then
    l_0_2 = (this_sigattrlog[2]).ppid
    l_0_3 = (this_sigattrlog[2]).utf8p2
  else
    if (this_sigattrlog[3]).matched then
      l_0_2 = (this_sigattrlog[3]).ppid
      l_0_3 = (this_sigattrlog[3]).utf8p2
    else
      return mp.CLEAN
    end
  end
end
if isnull(l_0_2) or isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = (mp.ContextualExpandEnvironmentVariables)(l_0_3)
if isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if (string.find)(l_0_3, "\\microsoft\\windows defender advanced threat protection\\", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\windows\\ccm\\systemtemp\\", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\windows\\ccm\\signedscripts\\", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\windows\\ccmcache\\", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\microsoft intune management extension\\", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\saw\\system\\sawhealthcheck.ps1", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\windows\\imecache\\healthscripts\\[^\\]+\\detect%.ps1") ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, "\\windows\\temp\\nessus_[^%.]+%.tmp") ~= nil then
  return mp.CLEAN
end
local l_0_4, l_0_5 = (bm.get_process_relationships)(l_0_2)
if isnull(l_0_5) then
  return mp.CLEAN
end
for l_0_9,l_0_10 in ipairs(l_0_5) do
  if not isnull(l_0_10.image_path) and (mp.bitand)(l_0_10.reason_ex, 2) == 2 then
    local l_0_11 = (MpCommon.PathToWin32Path)(l_0_10.image_path)
    if not isnull(l_0_11) then
      l_0_11 = (string.lower)(l_0_11)
    end
    if (string.find)(l_0_11, "\\windows\\system32\\csrss.exe", 1, true) ~= nil then
      return mp.CLEAN
    end
    if (mp.IsPathExcludedForHipsRule)(l_0_11, "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

