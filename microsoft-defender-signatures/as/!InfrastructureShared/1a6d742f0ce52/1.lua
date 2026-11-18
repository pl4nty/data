-- Threat: !InfrastructureShared
-- Name: 1a6d742f0ce52
-- Type: 21

function getParentCmdline(l_1_0, l_1_1, l_1_2)
  if l_1_2 == 0 or l_1_1 == nil or l_1_0 == nil then
    return ""
  end
  if type(l_1_1) == "string" and l_1_1 == "" then
    return ""
  end
  local l_1_3 = mp.GetParentProcInfo(l_1_0)
  if l_1_3 ~= nil and l_1_3.ppid ~= nil then
    local l_1_4 = mp.GetProcessCommandLine(l_1_3.ppid)
    if l_1_4 ~= nil and l_1_4 ~= "" then
      if type(l_1_1) == "table" then
        for l_1_5, l_1_6 in ipairs(l_1_1) do
          if l_1_6 ~= nil and l_1_6 ~= "" and string.find(l_1_4, l_1_6, 1, true) then
            return l_1_4
          end
        end
      elseif string.find(l_1_4, l_1_1, 1, true) then
        return l_1_4
      end
    end
    return getParentCmdline(l_1_3.ppid, l_1_1, l_1_2 - 1)
  end
  return ""
end

function user_data_dir(l_2_0)
  local l_2_1 = l_2_0:match("%-%-user%-data%-dir=\"([^\"]+)\"") or l_2_0:match("%-%-user%-data%-dir='([^']+)'")
  l_2_1 = l_2_1 or l_2_0:match("%-%-user%-data%-dir=([^%s][^%-]-)%s+%-%-") or l_2_0:match("%-%-user%-data%-dir=([^%s].*)$")
  if not l_2_1 then
    return nil
  end
  return l_2_1
end

function home_dir(l_3_0)
  if not l_3_0 then
    return nil
  end
  local l_3_1 = l_3_0:match("^(/Users/[^/]+)/Library/")
  if not l_3_1 then
    return nil
  end
  return l_3_1
end

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = getParentCmdline(l_0_0, {
  "Helper (Plugin)",
  "--utility-sub-type=node.mojom.NodeService"
}, 3)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
mp.set_mpattribute(string.format("MpInternal_researchdata=CommandLine=%s", l_0_2))
local l_0_3 = user_data_dir(l_0_2)
if l_0_3 == nil or l_0_3 == "" then
  return mp.INFECTED
end
if l_0_2:find("Claude", 1, true) then
  mp.TriggerScanResource("folder", l_0_3 .. "/Claude Extensions")
  return mp.INFECTED
end
local l_0_4 = home_dir(l_0_3)
if l_0_4 == nil or l_0_4 == "" then
  return mp.INFECTED
end
if l_0_2:find("Visual Studio Code", 1, true) then
  mp.TriggerScanResource("folder", l_0_4 .. "/.vscode/extensions")
  return mp.INFECTED
end
if l_0_2:find("Trae", 1, true) then
  mp.TriggerScanResource("folder", l_0_4 .. "/.trae/extensions")
  return mp.INFECTED
end
if l_0_2:find("Cursor", 1, true) then
  mp.TriggerScanResource("folder", l_0_4 .. "/.cursor/extensions")
  return mp.INFECTED
end
if l_0_2:find("Antigravity", 1, true) then
  mp.TriggerScanResource("folder", l_0_4 .. "/.antigravity/extensions")
  return mp.INFECTED
end
return mp.INFECTED
