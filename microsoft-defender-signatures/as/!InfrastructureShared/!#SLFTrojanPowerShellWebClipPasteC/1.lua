-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellWebClipPasteC\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if l_0_1 == nil or l_0_1 < 100 or l_0_1 > 16384 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_2, l_0_3 = pcall(mp.readfile, 0, l_0_1)
;
(mp.readprotection)(true)
if not l_0_2 or type(l_0_3) ~= "string" or #l_0_3 < 100 then
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
  if #l_0_4 < 100 or #l_0_4 > 16384 then
    return mp.CLEAN
  end
  local l_0_7 = (string.lower)((string.gsub)(l_0_4, "[%^`]", ""))
  local l_0_8 = function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5 = 1, #l_1_1 do
    if (string.find)(l_1_0, l_1_1[l_1_5], 1, true) ~= nil then
      return true
    end
  end
  return false
end

  local l_0_9 = {}
  -- DECOMPILER ERROR at PC155: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC156: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC157: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC158: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC159: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC160: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC161: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC162: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC163: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC164: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC165: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC166: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC169: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC170: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC171: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC172: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC173: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC174: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC175: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC177: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC178: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC179: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC180: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC181: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC182: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC183: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC184: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC185: Overwrote pending register: R10 in 'AssignReg'

  if not ("iex")("invoke-expression", "invoke-command") then
    return mp.CLEAN
  end
  local l_0_10 = {}
  -- DECOMPILER ERROR at PC202: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC205: Overwrote pending register: R12 in 'AssignReg'

  local l_0_11, l_0_12, l_0_13, l_0_14, l_0_15 = FindRollingQueueContentMatch({"invoke-item"}, l_0_4, "iwr"), "invoke-webrequest"
  -- DECOMPILER ERROR at PC209: Overwrote pending register: R14 in 'AssignReg'

  if not l_0_11 then
    return ("irm").CLEAN
  end
  local l_0_16 = nil
  -- DECOMPILER ERROR at PC213: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC214: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC216: Overwrote pending register: R17 in 'AssignReg'

  local l_0_17, l_0_18 = ("invoke-restmethod")(("downloadstring").get_contextdata, ("downloadfile").CONTEXT_DATA_AMSI_APPNAME)
  -- DECOMPILER ERROR at PC222: Overwrote pending register: R18 in 'AssignReg'

  if l_0_17 and type("downloaddata") == "string" then
    local l_0_19 = tostring(l_0_15)
    local l_0_20 = "||"
    -- DECOMPILER ERROR at PC231: Overwrote pending register: R19 in 'AssignReg'

    -- DECOMPILER ERROR at PC232: Overwrote pending register: R20 in 'AssignReg'

    local l_0_21 = ("openread")("webclient")
    local l_0_22 = "||"
    -- DECOMPILER ERROR at PC235: Overwrote pending register: R21 in 'AssignReg'

    local l_0_23 = ("new-object net.").sub
    -- DECOMPILER ERROR at PC237: Overwrote pending register: R22 in 'AssignReg'

    local l_0_24 = "new-object system.net"
    -- DECOMPILER ERROR at PC243: Overwrote pending register: R24 in 'AssignReg'

    -- DECOMPILER ERROR at PC245: Overwrote pending register: R22 in 'AssignReg'

    local l_0_26 = string.sub
    do
      -- DECOMPILER ERROR at PC254: Overwrote pending register: R26 in 'AssignReg'

      -- DECOMPILER ERROR at PC260: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC263: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC269: Overwrote pending register: R29 in 'AssignReg'

      -- DECOMPILER ERROR at PC272: Overwrote pending register: R30 in 'AssignReg'

      -- DECOMPILER ERROR at PC278: Overwrote pending register: R21 in 'AssignReg'

      l_0_20(l_0_21, l_0_22, l_0_23)
      -- DECOMPILER ERROR at PC280: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC281: Overwrote pending register: R18 in 'AssignReg'

      do return l_0_20 end
      -- DECOMPILER ERROR at PC283: freeLocal<0 in 'ReleaseLocals'

      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

