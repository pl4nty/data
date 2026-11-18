-- Threat: !InfrastructureShared
-- Name: 5bb31bc7edc3
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = bm.get_imagepath()
if not (this_sigattrlog[1].matched and this_sigattrlog[2].matched) or isnull(this_sigattrlog[1].utf8p1) or isnull(this_sigattrlog[2].utf8p1) or isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_1) then
  return mp.CLEAN
end
l_0_0, l_0_1 = l_0_0.ppid, MpCommon.PathToWin32Path(l_0_1)
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.match(this_sigattrlog[1].utf8p1, "imagepath:(.*)")
local l_0_3 = string.match(this_sigattrlog[2].utf8p1, "imagepath:(.*)")
if isnull(l_0_2) or isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = MpCommon.PathToWin32Path(l_0_2)
local l_0_5 = MpCommon.PathToWin32Path(l_0_3)
if isnull(l_0_4) or isnull(l_0_5) then
  return mp.CLEAN
end
l_0_4, l_0_5 = string.lower(l_0_4), string.lower(l_0_5)
if l_0_4 == l_0_5 then
  return mp.CLEAN
end

function has_relationship(l_1_0, l_1_1, l_1_2)
  if isnull(l_1_0) or isnull(l_1_1) and isnull(l_1_2) then
    return nil
  end
  if isnull(l_1_1) then
    l_1_1 = {}
  end
  if isnull(l_1_2) then
    l_1_2 = {}
  end
  local l_1_3 = {parent = nil, inject = nil}
  for l_1_4, l_1_5 in pairs(l_1_0) do
    if not isnull(l_1_5.image_path) and not isnull(l_1_5.ppid) and not isnull(l_1_5.reason) then
      local l_1_6 = MpCommon.PathToWin32Path(l_1_5.image_path)
      local l_1_7, l_1_8
      if isnull(l_1_6) then
        l_1_6 = ""
      else
        l_1_7 = string.match(l_1_6, "..*[\\/](.+)")
        l_1_6 = string.lower(l_1_6)
      end
      if in_array(l_1_2, l_1_5.ppid) or in_array(l_1_1, l_1_6) then
        if l_1_5.reason == bm.RELATIONSHIP_CREATED then
          local l_1_9, l_1_10 = string.match(l_1_5.ppid, "pid:([0-9]+),ProcessStart:([0-9]+)")
          if not isnull(l_1_9) and not isnull(l_1_10) and not isnull(l_1_7) then
            l_1_8 = string.format("imagename:%s;targetprocessppid:%d:%d", l_1_7, l_1_9, l_1_10)
          end
          l_1_3.parent = {
            name = l_1_6,
            ppid = l_1_5.ppid,
            trigger = l_1_8
          }
        elseif l_1_5.reason == bm.RELATIONSHIP_INJECTION then
          l_1_3.inject = {
            name = l_1_6,
            ppid = l_1_5.ppid
          }
        end
      end
    end
  end
  return l_1_3
end

local l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11
local l_0_12 = has_relationship(bm.get_process_relationships(), {l_0_4, l_0_5})
if isnull(l_0_12) or isnull(l_0_12.parent) or isnull(l_0_12.parent.name) or isnull(l_0_12.parent.ppid) or isnull(l_0_12.parent.trigger) then
  return mp.CLEAN
else
  l_0_6, l_0_7 = l_0_12.parent.name, l_0_12.parent.ppid
  if not isnull(l_0_12.parent.trigger) then
    l_0_8 = l_0_12.parent.trigger
  end
end
if not isnull(l_0_12.inject) and not isnull(l_0_12.inject.name) and not isnull(l_0_12.inject.ppid) then
  l_0_9, l_0_10 = l_0_12.inject.name, l_0_12.inject.ppid
elseif l_0_6 == l_0_4 then
  l_0_9 = l_0_5
elseif l_0_6 == l_0_5 then
  l_0_9 = l_0_4
else
  return mp.CLEAN
end
local l_0_13 = string.match(l_0_1, "..*[\\/](.+)")
local l_0_14 = string.match(l_0_9, "..*[\\/](.+)")
local l_0_15 = string.match(l_0_6, "..*[\\/](.+)")
if isnull(l_0_14) or isnull(l_0_15) or isnull(l_0_13) or l_0_14 == "csrss.exe" and in_array({
  "senseir.exe",
  "sensecm.exe",
  "agentexecutor.exe"
}, l_0_15) and l_0_13 == "powershell.exe" or l_0_14 == "svchost.exe" and l_0_15 == "explorer.exe" and in_array({
  "chrome.exe",
  "excel.exe",
  "msedge.exe",
  "winword.exe",
  "outlook.exe",
  "powerpnt.exe"
}, l_0_13) or l_0_14 == "officeclicktorun.exe" and in_array({
  "excel.exe",
  "winword.exe",
  "outlook.exe",
  "powerpnt.exe"
}, l_0_13) or l_0_14 == "csrss.exe" and l_0_15 == "powershell.exe" and l_0_13 == "csc.exe" or l_0_14 == "csrss.exe" and l_0_15 == "azqualysscancommand.exe" and l_0_13 == "cmd.exe" or l_0_14 == "microsoft.management.services.intunewindowsagent.exe" and l_0_15 == "agentexecutor.exe" and l_0_13 == "conhost.exe" or l_0_14 == "powershell.exe" and in_array({
  "cmd.exe",
  "mpcmdrun.exe"
}, l_0_15) and l_0_13 == "conhost.exe" then
  return mp.CLEAN
end
local l_0_16
if isnull(l_0_10) then
  l_0_16 = has_relationship(bm.get_process_relationships(l_0_7), {l_0_9})
else
  l_0_16 = has_relationship(bm.get_process_relationships(l_0_7), {}, {l_0_10})
end
if not isnull(l_0_16) and not isnull(l_0_16.parent) and not isnull(l_0_16.parent.ppid) then
  l_0_11, l_0_10 = "created", l_0_16.parent.ppid
elseif not isnull(l_0_16) and not isnull(l_0_16.inject) and not isnull(l_0_16.inject.ppid) then
  l_0_11, l_0_10 = "injected", l_0_16.inject.ppid
end
if l_0_11 == "created" and in_array({
  "cmd.exe",
  "powershell.exe"
}, l_0_15) then
  return mp.CLEAN
end
if not isnull(l_0_10) then
  bm.trigger_sig_target_propagate(string.format("ProcessReparent %s from %s to %s as new parent of: %s", l_0_11, l_0_10, l_0_7, l_0_0), l_0_8, l_0_10)
end
return mp.CLEAN
