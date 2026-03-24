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

local l_0_1 = function(l_4_0)
  -- function num : 0_3
  if not l_4_0 or l_4_0 == "" then
    return nil
  end
  l_4_0 = l_4_0:gsub("^%s+", "")
  local l_4_1 = l_4_0:match("^\"([^\"]+)\"")
  if l_4_1 then
    return l_4_1
  end
  local l_4_2, l_4_3 = l_4_0:match, l_4_0
  do
    local l_4_4 = "^([^%s]+)"
    do return l_4_2(l_4_3, l_4_4) end
    -- DECOMPILER ERROR at PC21: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

local l_0_2 = function(l_5_0)
  -- function num : 0_4
  if not l_5_0 or l_5_0 == "" then
    return nil
  end
  l_5_0 = (l_5_0:gsub("^%s+", "")):gsub("%s+$", "")
  l_5_0 = (l_5_0:gsub("^\"", "")):gsub("\"$", "")
  return l_5_0:match("([^\\/:]+)$") or l_5_0
end

BrowserExecutableFromScannedCmdlineGate = function()
  -- function num : 0_5 , upvalues : l_0_0, l_0_1
  local l_6_0 = {}
  l_6_0.msedge = true
  l_6_0.msedgewebview2 = true
  l_6_0.chrome = true
  local l_6_1 = (mp.GetScannedPPID)()
  if not l_6_1 then
    return false
  end
  local l_6_2 = (mp.GetProcessCommandLine)(l_6_1)
  if not l_6_2 or l_6_2 == "" then
    return false
  end
  local l_6_3 = nil
  local l_6_4, l_6_5 = pcall(function()
    -- function num : 0_5_0 , upvalues : l_6_2
    local l_7_0 = mp.GetExecutablesFromCommandLine
    local l_7_1 = l_6_2
    do return l_7_0(l_7_1) end
    -- DECOMPILER ERROR at PC5: Confused about usage of register R1 for local variables in 'ReleaseLocals'

  end
)
  if l_6_4 and l_6_5 then
    l_6_3 = l_6_5
  end
  if l_6_3 then
    for l_6_9,l_6_10 in pairs(l_6_3) do
      local l_6_11 = l_0_0(l_6_10)
      if l_6_11 and l_6_0[l_6_11] then
        return true
      end
    end
    return false
  end
  local l_6_12 = l_0_1(l_6_2)
  local l_6_13 = l_0_0(l_6_12)
  do
    do return l_6_13 and l_6_0[l_6_13] == true end
    -- DECOMPILER ERROR at PC65: freeLocal<0 in 'ReleaseLocals'

    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

urldecode = function(l_7_0)
  -- function num : 0_6
  if not l_7_0 then
    return nil
  end
  return l_7_0:gsub("%%(%x%x)", function(l_8_0)
    -- function num : 0_6_0
    local l_8_1 = string.char
    do
      local l_8_2, l_8_3, l_8_4 = tonumber(l_8_0, 16), .end
      do return l_8_1(l_8_2, l_8_3, l_8_4) end
      -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)
end

local l_0_3 = function(l_8_0)
  -- function num : 0_7
  if not l_8_0 or l_8_0 == "" then
    return nil
  end
  local l_8_1 = {}
  -- DECOMPILER ERROR at PC14: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC15: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC17: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC17: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC18: Overwrote pending register: R5 in 'AssignReg'

  for l_8_6 in ("chatgpt.com")("chat.openai.com", "perplexity.ai") do
    local l_8_3 = "copilot.microsoft.com"
    -- DECOMPILER ERROR at PC21: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC22: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC26: Confused about usage of register: R6 in 'UnsetPending'

    if ("grok.com")("chat.deepseek.com") then
      return "claude.ai"
    end
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R6 in 'UnsetPending'

    do return "claude.ai" end
  end
  local l_8_7 = nil
  if urldecode(l_8_0) and urldecode(l_8_0) ~= l_8_0 then
    for l_8_11 in (urldecode(l_8_0)):gmatch("https?://[^%s\"\']+") do
      local l_8_8 = nil
      if l_8_7(("grok.com")("chat.deepseek.com")) then
        return ("grok.com")("chat.deepseek.com")
      end
      do return ("grok.com")("chat.deepseek.com") end
    end
  end
  do
    local l_8_12 = nil
    do
      local l_8_13 = nil
      if ((string.lower)(l_8_0)):match("([%w%-%._]+%[%.[%]]%w[%w%-%._]+[^%s\"\']*)") then
        return ((string.lower)(l_8_0)):match("([%w%-%._]+%[%.[%]]%w[%w%-%._]+[^%s\"\']*)")
      end
      do return nil end
      -- DECOMPILER ERROR at PC62: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

do
  local l_0_4 = function(l_9_0)
  -- function num : 0_8
  if not l_9_0 or l_9_0 == "" then
    return nil
  end
  for l_9_4 in l_9_0:gmatch("https?://[^%s\"\']+") do
    local l_9_5 = (string.lower)(l_9_4)
    if (string.find)(l_9_5, "copilot.microsoft.com", 1, true) or (string.find)(l_9_5, "chatgpt.com", 1, true) or (string.find)(l_9_5, "chat.openai.com", 1, true) or (string.find)(l_9_5, "perplexity.ai", 1, true) or (string.find)(l_9_5, "claude.ai", 1, true) or (string.find)(l_9_5, "grok.com", 1, true) or (string.find)(l_9_5, "chat.deepseek.com", 1, true) then
      return l_9_4
    end
  end
  local l_9_6 = urldecode(l_9_0)
  if l_9_6 and l_9_6 ~= l_9_0 then
    for l_9_10 in l_9_6:gmatch("https?://[^%s\"\']+") do
      local l_9_11 = (string.lower)(l_9_10)
      if (string.find)(l_9_11, "copilot.microsoft.com", 1, true) or (string.find)(l_9_11, "chatgpt.com", 1, true) or (string.find)(l_9_11, "chat.openai.com", 1, true) or (string.find)(l_9_11, "perplexity.ai", 1, true) or (string.find)(l_9_11, "claude.ai", 1, true) or (string.find)(l_9_11, "grok.com", 1, true) or (string.find)(l_9_11, "chat.deepseek.com", 1, true) then
        return l_9_10
      end
    end
  end
  do
    return nil
  end
end

  -- WARNING: undefined locals caused missing assignments!
end

