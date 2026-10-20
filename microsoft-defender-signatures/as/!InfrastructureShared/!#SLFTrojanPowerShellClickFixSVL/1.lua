-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanPowerShellClickFixSVL\1.luac 

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
  if #l_0_3 < 16 or #l_0_3 > 8192 then
    return mp.CLEAN
  end
  local l_0_6 = (string.lower)(l_0_3)
  local l_0_7 = function(l_1_0, l_1_1)
  -- function num : 0_0
  local l_1_2 = {}
  for l_1_6 = 1, #l_1_1, 2 do
    local l_1_7 = {}
    local l_1_8 = 1
    local l_1_9 = 1
    while 1 do
      local l_1_10, l_1_11 = (string.find)(l_1_0, l_1_1[l_1_6], l_1_9, true)
      if l_1_10 == nil then
        break
      end
      if l_1_6 == 1 then
        l_1_7[#l_1_7 + 1] = l_1_11
      else
        while l_1_8 < #l_1_2 and l_1_2[l_1_8 + 1] < l_1_10 do
          l_1_8 = l_1_8 + 1
        end
        local l_1_12 = l_1_2[l_1_8]
        if l_1_12 < l_1_10 and l_1_10 - l_1_12 - 1 <= l_1_1[l_1_6 - 1] then
          l_1_7[#l_1_7 + 1] = l_1_11
        end
      end
      do
        l_1_9 = l_1_10 + 1
        -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
    l_1_10 = next
    l_1_11 = l_1_7
    l_1_10 = l_1_10(l_1_11)
    if l_1_10 == nil then
      l_1_10 = false
      return l_1_10
    end
    l_1_2 = l_1_7
  end
  return true
end

  local l_0_8 = {}
  local l_0_9 = {}
  -- DECOMPILER ERROR at PC104: No list found for R7 , SetList fails

  local l_0_10 = {}
  -- DECOMPILER ERROR at PC106: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC107: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC109: No list found for R8 , SetList fails

  local l_0_11 = {}
  -- DECOMPILER ERROR at PC111: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC112: No list found for R9 , SetList fails

  local l_0_12 = {}
  -- DECOMPILER ERROR at PC114: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC115: No list found for R10 , SetList fails

  local l_0_13 = {}
  -- DECOMPILER ERROR at PC122: No list found for R11 , SetList fails

  local l_0_14 = {}
  -- DECOMPILER ERROR at PC124: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC125: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC126: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC127: No list found for R12 , SetList fails

  local l_0_15 = {}
  -- DECOMPILER ERROR at PC129: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC130: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC131: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC132: No list found for R13 , SetList fails

  local l_0_16 = {}
  -- DECOMPILER ERROR at PC134: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC135: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC137: No list found for R14 , SetList fails

  local l_0_17 = {}
  -- DECOMPILER ERROR at PC139: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC140: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC142: No list found for R15 , SetList fails

  local l_0_18 = {}
  -- DECOMPILER ERROR at PC144: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC145: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC147: No list found for R16 , SetList fails

  local l_0_19 = {}
  -- DECOMPILER ERROR at PC149: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC150: No list found for R17 , SetList fails

  local l_0_20 = {}
  -- DECOMPILER ERROR at PC152: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC156: No list found for R18 , SetList fails

  local l_0_21 = {}
  -- DECOMPILER ERROR at PC158: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC162: No list found for R19 , SetList fails

  local l_0_22 = {}
  -- DECOMPILER ERROR at PC164: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: No list found for R20 , SetList fails

  local l_0_23 = {}
  -- DECOMPILER ERROR at PC170: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC174: No list found for R21 , SetList fails

  local l_0_24 = {}
  -- DECOMPILER ERROR at PC176: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC179: No list found for R22 , SetList fails

  local l_0_25 = {}
  -- DECOMPILER ERROR at PC181: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC182: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC186: No list found for R23 , SetList fails

  local l_0_26 = {}
  -- DECOMPILER ERROR at PC188: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC189: No list found for R24 , SetList fails

  local l_0_27 = {}
  -- DECOMPILER ERROR at PC191: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC192: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC193: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC196: No list found for R25 , SetList fails

  local l_0_28 = {}
  -- DECOMPILER ERROR at PC198: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC199: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC200: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC201: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC203: No list found for R26 , SetList fails

  local l_0_29 = {}
  -- DECOMPILER ERROR at PC205: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC206: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC207: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC208: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC210: No list found for R27 , SetList fails

  local l_0_30 = {}
  -- DECOMPILER ERROR at PC212: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC213: No list found for R28 , SetList fails

  local l_0_31 = {}
  -- DECOMPILER ERROR at PC215: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC216: No list found for R29 , SetList fails

  local l_0_32 = {}
  -- DECOMPILER ERROR at PC218: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC219: No list found for R30 , SetList fails

  local l_0_33 = {}
  -- DECOMPILER ERROR at PC221: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC222: No list found for R31 , SetList fails

  local l_0_34 = {}
  -- DECOMPILER ERROR at PC225: No list found for R32 , SetList fails

  local l_0_35 = {}
  -- DECOMPILER ERROR at PC228: No list found for R33 , SetList fails

  local l_0_36 = {}
  -- DECOMPILER ERROR at PC231: No list found for R34 , SetList fails

  local l_0_37 = {}
  -- DECOMPILER ERROR at PC234: No list found for R35 , SetList fails

  local l_0_38 = {}
  -- DECOMPILER ERROR at PC237: No list found for R36 , SetList fails

  local l_0_39 = {}
  -- DECOMPILER ERROR at PC242: No list found for R37 , SetList fails

  local l_0_40 = {}
  -- DECOMPILER ERROR at PC244: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC245: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC253: No list found for R38 , SetList fails

  local l_0_41 = {}
  -- DECOMPILER ERROR at PC255: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC256: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC257: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC258: No list found for R39 , SetList fails

  local l_0_42 = {}
  -- DECOMPILER ERROR at PC260: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC261: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC262: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC263: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC264: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC265: No list found for R40 , SetList fails

  local l_0_43 = {}
  -- DECOMPILER ERROR at PC267: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC268: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC269: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC270: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC271: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC272: No list found for R41 , SetList fails

  local l_0_44 = {}
  -- DECOMPILER ERROR at PC274: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC275: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC276: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC277: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC278: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC279: No list found for R42 , SetList fails

  local l_0_45 = {}
  -- DECOMPILER ERROR at PC281: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC282: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC283: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC284: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC286: No list found for R43 , SetList fails

  local l_0_46 = {}
  -- DECOMPILER ERROR at PC288: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC289: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC290: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC291: No list found for R44 , SetList fails

  local l_0_47 = {}
  -- DECOMPILER ERROR at PC293: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC294: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC295: Overwrote pending register: R48 in 'AssignReg'

  -- DECOMPILER ERROR at PC296: No list found for R45 , SetList fails

  local l_0_48 = {}
  -- DECOMPILER ERROR at PC298: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC299: No list found for R46 , SetList fails

  -- DECOMPILER ERROR at PC300: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC314: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC315: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC316: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC317: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC318: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC319: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC323: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC324: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC325: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC326: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC327: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC328: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC332: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC334: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC335: Overwrote pending register: R9 in 'AssignReg'

  if l_0_10 and l_0_10 and l_0_10 then
    do
      for l_0_13,l_0_14 in l_0_10 do
        -- DECOMPILER ERROR at PC338: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC339: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC340: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC344: Overwrote pending register: R7 in 'AssignReg'

        if l_0_15 then
          break
        end
      end
      -- DECOMPILER ERROR at PC350: Overwrote pending register: R8 in 'AssignReg'

      if l_0_9 == nil then
        return l_0_10.CLEAN
      end
      -- DECOMPILER ERROR at PC354: Overwrote pending register: R9 in 'AssignReg'

      -- DECOMPILER ERROR at PC355: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC359: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC363: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC364: Overwrote pending register: R14 in 'AssignReg'

      if not FindRollingQueueContentMatch({l_0_11, l_0_12}, l_0_13) then
        return l_0_16
      end
      -- DECOMPILER ERROR at PC366: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC367: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC369: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC373: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC377: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC379: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC385: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC388: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC389: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC390: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC391: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC394: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC397: Overwrote pending register: R23 in 'AssignReg'

      -- DECOMPILER ERROR at PC398: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC399: Overwrote pending register: R24 in 'AssignReg'

      -- DECOMPILER ERROR at PC400: Overwrote pending register: R25 in 'AssignReg'

      -- DECOMPILER ERROR at PC404: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC405: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC406: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC407: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC408: Overwrote pending register: R18 in 'AssignReg'

      l_0_17(l_0_18, l_0_19, l_0_20)
      -- DECOMPILER ERROR at PC410: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC411: Overwrote pending register: R15 in 'AssignReg'

      do return l_0_17 end
      -- DECOMPILER ERROR at PC413: Confused about usage of register R12 for local variables in 'ReleaseLocals'

      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

