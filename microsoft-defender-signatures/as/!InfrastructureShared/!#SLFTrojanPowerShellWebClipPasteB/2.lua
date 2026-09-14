-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellWebClipPasteB\2.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if l_0_1 == nil or l_0_1 < 16 or l_0_1 > 8192 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_2, l_0_3 = pcall(mp.readfile, 0, l_0_1)
;
(mp.readprotection)(true)
if not l_0_2 or type(l_0_3) ~= "string" or #l_0_3 < 16 then
  return mp.CLEAN
end
local l_0_4 = l_0_3
do
  if (string.find)((string.sub)(l_0_4, 1, 64), (string.char)(0), 1, true) then
    local l_0_5, l_0_6 = pcall(mp.utf16to8, l_0_4)
    if l_0_5 and type(l_0_6) == "string" and #l_0_6 > 0 then
      l_0_4 = l_0_6
    end
  end
  if #l_0_4 < 16 or #l_0_4 > 8192 then
    return mp.CLEAN
  end
  local l_0_7 = (string.lower)(l_0_4)
  local l_0_8 = {}
  -- DECOMPILER ERROR at PC132: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC133: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC134: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC135: Overwrote pending register: R9 in 'AssignReg'

  if not ("iex")("invoke-expression", "invoke-command") then
    return mp.CLEAN
  end
  local l_0_9, l_0_10, l_0_11, l_0_12, l_0_13 = FindRollingQueueContentMatch({"IsClickFixCMD"}, l_0_4), "iwr", "invoke-webrequest"
  -- DECOMPILER ERROR at PC150: Overwrote pending register: R12 in 'AssignReg'

  if not l_0_9 then
    return ("irm").CLEAN
  end
  local l_0_14 = nil
  -- DECOMPILER ERROR at PC154: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC155: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC157: Overwrote pending register: R15 in 'AssignReg'

  local l_0_15, l_0_16 = ("invoke-restmethod")(("downloadstring").get_contextdata, ("downloadfile").CONTEXT_DATA_AMSI_APPNAME)
  -- DECOMPILER ERROR at PC163: Overwrote pending register: R16 in 'AssignReg'

  if l_0_15 and type("downloaddata") == "string" then
    local l_0_17 = tostring(l_0_13)
    local l_0_18 = "||"
    -- DECOMPILER ERROR at PC172: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC173: Overwrote pending register: R18 in 'AssignReg'

    local l_0_19 = ("webclient")("frombase64string")
    local l_0_20 = "||"
    -- DECOMPILER ERROR at PC176: Overwrote pending register: R19 in 'AssignReg'

    local l_0_21 = ("-encodedcommand").sub
    -- DECOMPILER ERROR at PC178: Overwrote pending register: R20 in 'AssignReg'

    local l_0_22 = "-enc "
    -- DECOMPILER ERROR at PC184: Overwrote pending register: R22 in 'AssignReg'

    -- DECOMPILER ERROR at PC186: Overwrote pending register: R20 in 'AssignReg'

    local l_0_24 = string.sub
    do
      -- DECOMPILER ERROR at PC195: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC201: Overwrote pending register: R25 in 'AssignReg'

      -- DECOMPILER ERROR at PC204: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC210: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC213: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC219: Overwrote pending register: R19 in 'AssignReg'

      l_0_18(l_0_19, l_0_20, l_0_21)
      -- DECOMPILER ERROR at PC221: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC222: Overwrote pending register: R16 in 'AssignReg'

      do return l_0_18 end
      -- DECOMPILER ERROR at PC224: freeLocal<0 in 'ReleaseLocals'

      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

