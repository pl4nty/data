-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellCompiledRemoteLoaderA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 < 200 or l_0_0 > 8192 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
;
(mp.readprotection)(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 < 200 then
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
  if #l_0_3 < 200 or #l_0_3 > 8192 then
    return mp.CLEAN
  end
  local l_0_6 = (string.lower)((string.gsub)(l_0_3, "[%^`]", ""))
  if not (string.find)(l_0_6, "webclient", 1, true) then
    return mp.CLEAN
  end
  if not (string.find)(l_0_6, "downloadstring(", 1, true) then
    return mp.CLEAN
  end
  if not (string.find)(l_0_6, "codedom.compiler", 1, true) then
    return mp.CLEAN
  end
  if not (string.find)(l_0_6, "compileassemblyfromsource", 1, true) then
    return mp.CLEAN
  end
  if not (string.find)(l_0_6, "process.start", 1, true) then
    return mp.CLEAN
  end
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC166: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R7 in 'AssignReg'

  local l_0_8, l_0_9, l_0_10, l_0_11, l_0_12 = ("IsClickFixCMD")("IsClickFixCMD_Malicious", l_0_3)
  if not l_0_8 then
    return mp.CLEAN
  end
  local l_0_13 = tostring(l_0_12)
  local l_0_14 = "||"
  local l_0_15 = tostring(l_0_9)
  local l_0_16 = "||"
  local l_0_17 = string.sub
  local l_0_18 = tostring
  do
    l_0_18 = l_0_18(l_0_11 or "-")
    l_0_17 = l_0_17(l_0_18, 1, 128)
    l_0_18 = "||"
    l_0_13 = l_0_13 .. l_0_14 .. l_0_15 .. l_0_16 .. l_0_17 .. l_0_18 .. (string.sub)(tostring(l_0_10), 1, 320) .. "||" .. (string.sub)(tostring(l_0_3), 1, 320)
    l_0_14 = set_research_data
    l_0_15 = "CompiledRemoteLoader_A"
    l_0_16 = l_0_13
    l_0_17 = false
    l_0_14(l_0_15, l_0_16, l_0_17)
    l_0_14 = mp
    l_0_14 = l_0_14.INFECTED
    do return l_0_14 end
    -- DECOMPILER ERROR at PC221: freeLocal<0 in 'ReleaseLocals'

  end
end

