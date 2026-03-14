-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\AICopilotHelpers\1.luac 

-- params : ...
-- function num : 0
basename = function(l_1_0)
  -- function num : 0_0
  if not l_1_0 then
    return nil
  end
  local l_1_1, l_1_2 = ((string.lower)(l_1_0)):match, (string.lower)(l_1_0)
  do
    local l_1_3 = "([^\\\\]+)$"
    do return l_1_1(l_1_2, l_1_3) end
    -- DECOMPILER ERROR at PC12: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

InitiatingProcessGate = function()
  -- function num : 0_1
  local l_2_0 = {}
  l_2_0.outlook = true
  l_2_0.olk = true
  l_2_0.msedge = true
  l_2_0.msedgewebview2 = true
  l_2_0.chrome = true
  l_2_0["ms-teams"] = true
  l_2_0.teams = true
  local l_2_1 = (mp.GetParentProcInfo)()
  if not l_2_1 or not l_2_1.image_path then
    return false
  end
  do
    local l_2_2 = basename(l_2_1.image_path)
    if not l_2_2 then
      return false
    end
    l_2_2 = l_2_2:gsub("%.exe$", "")
    do return l_2_0[l_2_2] == true end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

do
  local l_0_0 = function(l_3_0)
  -- function num : 0_2
  if not l_3_0 then
    return nil
  end
  l_3_0 = (l_3_0:gsub("^%s+", "")):gsub("%s+$", "")
  l_3_0 = (l_3_0:gsub("^\"", "")):gsub("\"$", "")
  do
    if not ((string.lower)(l_3_0)):match("([^\\\\/:]+)$") then
      local l_3_1 = (string.lower)(l_3_0)
    end
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

    return l_3_1:gsub("%.exe$", "")
  end
end

  -- WARNING: undefined locals caused missing assignments!
end

