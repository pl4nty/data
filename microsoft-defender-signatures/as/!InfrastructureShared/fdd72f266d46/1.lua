-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fdd72f266d46\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (string.find)(l_0_1, "echo", 1, true)
do
  if not (string.find)(l_0_1, "|%s*base64%s+%-d") then
    local l_0_3, l_0_4 = (string.find)(l_0_1, "|%s*base64%s+%-%-decode")
  end
  local l_0_5 = nil
  if not l_0_2 or not l_0_5 or not (string.find)(l_0_1, "|%s*[bkdz]?a?sh") then
    return mp.CLEAN
  end
  if l_0_5 <= l_0_2 or (string.find)(l_0_1, "|%s*[bkdz]?a?sh") <= l_0_5 then
    return mp.CLEAN
  end
  local l_0_6 = nil
  if not (string.match)(l_0_1, "echo%s+(.-)%s*|%s*base64") then
    return mp.CLEAN
  end
  local l_0_7 = nil
  local l_0_8 = nil
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R7 in 'UnsetPending'

  if #(string.gsub)((string.gsub)((string.gsub)((string.match)(l_0_1, "echo%s+(.-)%s*|%s*base64"), "^[\'\"]", ""), "[\'\"]$", ""), "[^A-Za-z0-9+/=]", "") < 10 or #(string.gsub)((string.gsub)((string.gsub)((string.match)(l_0_1, "echo%s+(.-)%s*|%s*base64"), "^[\'\"]", ""), "[\'\"]$", ""), "[^A-Za-z0-9+/=]", "") > 131072 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC91: Confused about usage of register: R7 in 'UnsetPending'

  local l_0_9 = nil
  if #(string.gsub)((string.gsub)((string.gsub)((string.match)(l_0_1, "echo%s+(.-)%s*|%s*base64"), "^[\'\"]", ""), "[\'\"]$", ""), "[^A-Za-z0-9+/=]", "") % 4 == 1 then
    return mp.CLEAN
  end
  local l_0_10 = nil
  if (MpCommon.Base64Decode)(l_0_8) and #(MpCommon.Base64Decode)(l_0_8) > 0 then
    if (string.match)((MpCommon.Base64Decode)(l_0_8), "^sudo%s+lsof%s+%-a%s+%-p%s+%d+%s+%-d%s+cwd%s+%-Fn%s+2>/dev/null%s*|%s*sed%s+%-n%s+\'s/%^n//p\'%s*|%s*head%s+%-1%s*$") then
      return mp.CLEAN
    end
    local l_0_11 = nil
    local l_0_12 = nil
    set_research_data("DecodedPayload", (string.sub)(l_0_11, 1, math_min(#(MpCommon.Base64Decode)(l_0_8), 1024)), false)
    set_research_data("PayloadSize", tostring(#l_0_11), false)
  end
  do
    return mp.INFECTED
  end
end

