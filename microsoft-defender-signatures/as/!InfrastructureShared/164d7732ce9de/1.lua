-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\164d7732ce9de\1.luac 

-- params : ...
-- function num : 0
getParentCmdline = function(l_1_0, l_1_1, l_1_2)
  -- function num : 0_0
  if l_1_2 == 0 or l_1_1 == "" or l_1_1 == nil or l_1_0 == nil then
    return ""
  end
  local l_1_3 = (mp.GetParentProcInfo)(l_1_0)
  if l_1_3 ~= nil and l_1_3.ppid ~= nil then
    local l_1_4 = (mp.GetProcessCommandLine)(l_1_3.ppid)
    do
      if l_1_4 ~= nil and l_1_4 ~= "" then
        local l_1_9 = string.find
        l_1_9 = l_1_9(l_1_4, l_1_1, 1, true)
        if l_1_9 then
          return l_1_4
        end
      end
      local l_1_5 = getParentCmdline
      local l_1_6 = l_1_3.ppid
      local l_1_7 = l_1_1
      do
        local l_1_8 = l_1_2 - 1
        do return l_1_5(l_1_6, l_1_7, l_1_8) end
        -- DECOMPILER ERROR at PC43: Confused about usage of register R6 for local variables in 'ReleaseLocals'

        l_1_4 = ""
        do return l_1_4 end
        -- DECOMPILER ERROR at PC45: Confused about usage of register R5 for local variables in 'ReleaseLocals'

      end
    end
  end
end

user_data_dir = function(l_2_0)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC19: freeLocal<0 in 'ReleaseLocals'

  -- DECOMPILER ERROR at PC22: Unhandled construct in 'MakeBoolean' P3

  if (not l_2_0:match("%-%-user%-data%-dir=\"([^\"]+)\"") and l_2_0:match("%-%-user%-data%-dir=\'([^\']+)\'")) or not l_2_0:match("%-%-user%-data%-dir=([^%s].*)$") then
    return nil
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  do return l_2_0:match("%-%-user%-data%-dir=([^%s].*)$") end
  -- DECOMPILER ERROR at PC24: freeLocal<0 in 'ReleaseLocals'

end

home_dir = function(l_3_0)
  -- function num : 0_2
  if not l_3_0 then
    return nil
  end
  local l_3_1 = l_3_0:match("^(/Users/[^/]+)/Library/")
  if not l_3_1 then
    return nil
  end
  return l_3_1
end

local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = getParentCmdline(l_0_0, "Helper (Plugin)", 3)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
;
(mp.set_mpattribute)((string.format)("MpInternal_researchdata=CommandLine=%s", l_0_2))
local l_0_3 = user_data_dir(l_0_2)
if l_0_3 == nil or l_0_3 == "" then
  return mp.INFECTED
end
if l_0_2:find("Claude", 1, true) then
  (mp.TriggerScanResource)("folder", l_0_3 .. "/Claude Extensions")
  return mp.INFECTED
end
local l_0_4 = home_dir(l_0_3)
if l_0_4 == nil or l_0_4 == "" then
  return mp.INFECTED
end
if l_0_2:find("Visual Studio Code", 1, true) then
  (mp.TriggerScanResource)("folder", l_0_4 .. "/.vscode/extensions")
  return mp.INFECTED
end
if l_0_2:find("Trae", 1, true) then
  (mp.TriggerScanResource)("folder", l_0_4 .. "/.trae/extensions")
  return mp.INFECTED
end
if l_0_2:find("Cursor", 1, true) then
  (mp.TriggerScanResource)("folder", l_0_4 .. "/.cursor/extensions")
  return mp.INFECTED
end
if l_0_2:find("Antigravity", 1, true) then
  (mp.TriggerScanResource)("folder", l_0_4 .. "/.antigravity/extensions")
  return mp.INFECTED
end
return mp.INFECTED

