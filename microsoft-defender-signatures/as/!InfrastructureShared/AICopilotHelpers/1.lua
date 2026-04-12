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

initiating_process_gate = function()
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
  if not l_3_0 or l_3_0 == "" then
    return nil
  end
  l_3_0 = l_3_0:gsub("^%s+", "")
  local l_3_1 = l_3_0:match("^\"([^\"]+)\"")
  if l_3_1 then
    return l_3_1
  end
  local l_3_2, l_3_3 = l_3_0:match, l_3_0
  do
    local l_3_4 = "^([^%s]+)"
    do return l_3_2(l_3_3, l_3_4) end
    -- DECOMPILER ERROR at PC21: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

local l_0_1 = function(l_4_0)
  -- function num : 0_3
  if not l_4_0 or l_4_0 == "" then
    return nil
  end
  l_4_0 = (l_4_0:gsub("^%s+", "")):gsub("%s+$", "")
  l_4_0 = (l_4_0:gsub("^\"", "")):gsub("\"$", "")
  return l_4_0:match("([^\\/:]+)$") or l_4_0
end

local l_0_3 = function(l_5_0)
  -- function num : 0_4 , upvalues : l_0_1, l_0_0
  local l_5_5 = nil
  if not l_5_0 or l_5_0 == "" then
    return nil
  end
  local l_5_1, l_5_2 = commandline_to_argv(l_5_0)
  if l_5_1 > 0 and l_5_2 ~= nil and l_5_2[1] ~= nil and l_5_2[1] ~= "" then
    local l_5_3 = l_0_1
    local l_5_4 = l_5_2[1]
    do return l_5_3(l_5_4) end
    -- DECOMPILER ERROR at PC23: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
  local l_5_6 = nil
  do
    local l_5_7, l_5_8 = .end
    do return l_0_1(l_5_6(l_5_0), l_5_7, l_5_8) end
    -- DECOMPILER ERROR at PC29: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

local l_0_4 = function(l_8_0)
  -- function num : 0_7
  if not l_8_0 or l_8_0 == "" then
    return nil, nil
  end
  local l_8_1 = (string.lower)(l_8_0)
  local l_8_2 = l_8_1:match("^https?://([^/%?\"\']+)")
  if not l_8_2 then
    return nil, nil
  end
  do
    if not l_8_2:match("^([^:]+)") and l_8_1:match("^https?://[^/%?\"\']+([^?\"\']*)") or "/" == "" then
      local l_8_3 = "/"
    end
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R3 in 'UnsetPending'

    return l_8_2, l_8_3
  end
end

local l_0_5 = function(l_9_0)
  -- function num : 0_8
  if not l_9_0 or l_9_0 == "" then
    return false
  end
  do return l_9_0 == "copilot.microsoft.com" or l_9_0 == "chatgpt.com" or l_9_0 == "chat.openai.com" or l_9_0 == "perplexity.ai" or l_9_0 == "claude.ai" or l_9_0 == "grok.com" or l_9_0 == "chat.deepseek.com" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_6 = function(l_10_0, l_10_1)
  -- function num : 0_9
  if not l_10_0 or not l_10_1 then
    return false
  end
  if l_10_1 ~= "/search" then
    do return l_10_0 ~= "perplexity.ai" end
    if l_10_1 ~= "/" then
      do return l_10_0 ~= "copilot.microsoft.com" and l_10_0 ~= "chatgpt.com" and l_10_0 ~= "chat.openai.com" end
      if l_10_0 == "claude.ai" or l_10_0 == "grok.com" or l_10_0 == "chat.deepseek.com" then
        return true
      end
      do return false end
      -- DECOMPILER ERROR: 7 unprocessed JMP targets
    end
  end
end

local l_0_8 = function(l_11_0)
  -- function num : 0_10
  if not l_11_0 or l_11_0 == "" then
    return nil
  end
  for l_11_4 in l_11_0:gmatch("https?://[^%s\"\']+") do
    do return l_11_4 end
  end
  local l_11_5 = urldecode(l_11_0)
  if l_11_5 and l_11_5 ~= l_11_0 then
    for l_11_9 in l_11_5:gmatch("https?://[^%s\"\']+") do
      do return l_11_9 end
    end
  end
  do
    local l_11_10 = (string.lower)(l_11_0)
    local l_11_11 = l_11_10:match("([%w%-%._]+%[%.[%]]%w[%w%-%._]+[^%s\"\']*)")
    if l_11_11 then
      return l_11_11
    end
    return nil
  end
end

do
  local l_0_12 = function(l_12_0)
  -- function num : 0_11 , upvalues : l_0_3, l_0_4
  if not l_12_0 or l_12_0 == "" then
    return nil
  end
  for l_12_4 in l_12_0:gmatch("https?://[^%s\"\']+") do
    local l_12_5 = l_0_3(l_12_4)
    if l_0_4(l_12_5) then
      return l_12_4
    end
  end
  local l_12_6 = urldecode(l_12_0)
  if l_12_6 and l_12_6 ~= l_12_0 then
    for l_12_10 in l_12_6:gmatch("https?://[^%s\"\']+") do
      local l_12_11 = l_0_3(l_12_10)
      if l_0_4(l_12_11) then
        return l_12_10
      end
    end
  end
  do
    return nil
  end
end

  -- DECOMPILER ERROR at PC56: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

