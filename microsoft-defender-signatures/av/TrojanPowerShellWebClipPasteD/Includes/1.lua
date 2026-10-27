-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanPowerShellWebClipPasteD\Includes\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 < 16 or l_0_0 > 16384 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
;
(mp.readprotection)(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 ~= l_0_0 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
do
  if (string.find)((string.sub)(l_0_3, 1, 64), (string.char)(0), 1, true) then
    local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
    if not l_0_4 or type(l_0_5) ~= "string" then
      return mp.CLEAN
    end
    l_0_3 = l_0_5
  end
  if #l_0_3 < 24 or #l_0_3 > 8192 then
    return mp.CLEAN
  end
  local l_0_6 = {}
  l_0_6.monster = true
  l_0_6.cfd = true
  l_0_6.top = true
  l_0_6.club = true
  l_0_6.online = true
  l_0_6.boats = true
  l_0_6.cc = true
  l_0_6.hair = true
  l_0_6.lol = true
  l_0_6.sbs = true
  l_0_6.shop = true
  local l_0_8 = function(l_1_0, l_1_1)
  -- function num : 0_0 , upvalues : l_0_6
  if type(l_1_1) ~= "string" then
    return false
  end
  do
    local l_1_2 = (string.match)((string.lower)(l_1_1), "^https?://[%w%.%-]+%.([a-z]+)/%?")
    do return l_1_2 ~= nil and l_0_6[l_1_2] == true end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

  local l_0_9, l_0_10, l_0_11, l_0_12, l_0_13 = , FindRollingQueueContentMatch({"IsClickFixCMD_Malicious"}, l_0_3, {minCandidateLength = 24, minKeyLength = 24, maxKeyLength = 8192, keyInCandidateMinLength = 24, candidateInKeyMinLength = 100, distinctiveMinLength = 40, distinctiveBlobMinLength = 64, entryFilter = l_0_8})
  if not l_0_10 or not l_0_8(l_0_12, l_0_13) then
    return mp.CLEAN
  end
  local l_0_14 = nil
  local l_0_15, l_0_16 = nil, pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_16 and type(R16_PC146) == "string" then
    l_0_15 = 
  end
  local l_0_17 = nil
  -- DECOMPILER ERROR at PC153: Overwrote pending register: R16 in 'AssignReg'

  local l_0_18 = tostring(R16_PC146)
  local l_0_19 = R16_PC146
  local l_0_20 = tostring(l_0_11)
  local l_0_21 = "||"
  local l_0_22 = string.sub
  do
    l_0_22 = l_0_22(tostring(l_0_15 or "-"), 1, 128)
    l_0_18 = l_0_18 .. l_0_19 .. l_0_20 .. l_0_21 .. l_0_22 .. "||" .. (string.sub)(tostring(l_0_13), 1, 128) .. "||" .. (string.sub)(tostring(l_0_12), 1, 320) .. "||" .. (string.sub)(l_0_3, 1, 320)
    -- DECOMPILER ERROR at PC194: Overwrote pending register: R16 in 'AssignReg'

    l_0_20 = "WebClipPaste_D"
    l_0_21 = l_0_18
    l_0_22 = false
    l_0_19(l_0_20, l_0_21, l_0_22)
    -- DECOMPILER ERROR at PC199: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC200: Overwrote pending register: R16 in 'AssignReg'

    do return l_0_19 end
    -- DECOMPILER ERROR at PC202: freeLocal<0 in 'ReleaseLocals'

  end
end

