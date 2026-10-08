-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellWebClipPasteZ!MTB\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 < 64 or l_0_0 > 8192 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
;
(mp.readprotection)(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 < 64 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
do
  if (string.find)((string.sub)(l_0_3, 1, 64), (string.char)(0), 1, true) then
    local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
    if l_0_4 and type(l_0_5) == "string" and #l_0_5 > 0 then
      l_0_3 = l_0_5
    end
  end
  if #l_0_3 < 64 or #l_0_3 > 8192 then
    return mp.CLEAN
  end
  local l_0_6 = (string.lower)((string.gsub)(l_0_3, "[%^`]", ""))
  l_0_6 = (string.gsub)(l_0_6, "^[%s%z]+", "")
  l_0_6 = (string.gsub)(l_0_6, "[%s%z]+$", "")
  if not (string.sub)(l_0_6, 1, 4) == "iex(" or (string.sub)(l_0_6, 1, 5) == "iex (" or (string.sub)(l_0_6, 1, 18) == "invoke-expression(" or (string.sub)(l_0_6, 1, 19) == "invoke-expression (" then
    return mp.CLEAN
  end
  do
    if not (string.find)(l_0_6, "iwr ", 1, true) and not (string.find)(l_0_6, "iwr(", 1, true) and not (string.find)(l_0_6, "invoke-webrequest ", 1, true) then
      local l_0_10 = nil
    end
    if not (string.find)(l_0_6, "invoke-webrequest(", 1, true) then
      return mp.CLEAN
    end
    local l_0_11 = nil
    -- DECOMPILER ERROR at PC203: Confused about usage of register: R7 in 'UnsetPending'

    -- DECOMPILER ERROR at PC206: Confused about usage of register: R7 in 'UnsetPending'

    if #l_0_6 < #"-usebasicparsing)" or (string.sub)(l_0_6, -#"-usebasicparsing)") ~= "-usebasicparsing)" then
      return mp.CLEAN
    end
    local l_0_12 = nil
    local l_0_13, l_0_14, l_0_15, l_0_16, l_0_17 = , FindRollingQueueContentMatch({"IsClickFixCMD", "IsClickFixCMD_Malicious"}, l_0_3)
    if not l_0_15 then
      return mp.CLEAN
    end
    local l_0_18 = nil
    local l_0_19 = nil
    local l_0_20 = "iex_iwr_usebasicparsing"
    local l_0_22 = "||"
    local l_0_24 = tostring(l_0_19 or "-")
    local l_0_25 = "||"
    local l_0_27 = tostring(l_0_16 or "-")
    do
      l_0_20 = l_0_20 .. l_0_22 .. l_0_24 .. l_0_25 .. l_0_27 .. "||" .. (string.sub)(tostring(l_0_18 or "-"), 1, 128) .. "||" .. (string.sub)(tostring(l_0_17 or "-"), 1, 320) .. "||" .. (string.sub)(tostring(l_0_3), 1, 320)
      l_0_22 = set_research_data
      l_0_24 = "WebClipPaste_SB"
      l_0_25 = l_0_20
      l_0_27 = false
      l_0_22(l_0_24, l_0_25, l_0_27)
      l_0_22 = mp
      l_0_22 = l_0_22.INFECTED
      do return l_0_22 end
      -- DECOMPILER ERROR at PC277: freeLocal<0 in 'ReleaseLocals'

      -- DECOMPILER ERROR: 11 unprocessed JMP targets
    end
  end
end

