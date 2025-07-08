-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFilenameHasUnicodeStyleCharA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 <= 20 then
  return mp.CLEAN
end
if (string.find)(l_0_0, "\240", 1, true) == nil and (string.find)(l_0_0, "\226", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2 = {}
l_0_2.name = "Bold"
l_0_2.upper_start = 119808
l_0_2.lower_start = 119834
local l_0_3 = {}
l_0_3.name = "Italic"
l_0_3.upper_start = 119860
l_0_3.lower_start = 119886
local l_0_4 = {}
l_0_4.name = "BoldItalic"
l_0_4.upper_start = 119912
l_0_4.lower_start = 119938
local l_0_5 = {}
l_0_5.name = "Script"
l_0_5.upper_start = 119964
l_0_5.lower_start = 119990
local l_0_6 = {}
l_0_6.name = "ScriptBold"
l_0_6.upper_start = 120016
l_0_6.lower_start = 120042
local l_0_7 = {}
l_0_7.name = "Fraktur"
l_0_7.upper_start = 120068
l_0_7.lower_start = 120094
local l_0_8 = {}
l_0_8.name = "FrakturBold"
l_0_8.upper_start = 120172
l_0_8.lower_start = 120198
local l_0_9 = {}
l_0_9.name = "DoubleStruck"
l_0_9.upper_start = 120120
l_0_9.lower_start = 120146
local l_0_10 = {}
l_0_10.name = "SansSerif"
l_0_10.upper_start = 120224
l_0_10.lower_start = 120250
local l_0_11 = {}
l_0_11.name = "SansSerifBold"
l_0_11.upper_start = 120276
l_0_11.lower_start = 120302
local l_0_12 = {}
l_0_12.name = "SansSerifItalic"
l_0_12.upper_start = 120328
l_0_12.lower_start = 120354
local l_0_13 = {}
l_0_13.name = "SansSerifBoldItalic"
l_0_13.upper_start = 120380
l_0_13.lower_start = 120406
local l_0_14 = {}
l_0_14.name = "Monospace"
l_0_14.upper_start = 120432
l_0_14.lower_start = 120458
local l_0_15 = {}
l_0_15.name = "SquaredLatin"
l_0_15.upper_start = 127280
l_0_15.lower_start = nil
-- DECOMPILER ERROR at PC96: No list found for R1 , SetList fails

l_0_3 = {name = "CircledLatin", upper_start = 9398, lower_start = 9424}
l_0_3 = function(l_1_0, l_1_1, l_1_2, l_1_3)
  -- function num : 0_0
  return (l_1_0 - 240) * 262144 + (l_1_1 - 128) * 4096 + (l_1_2 - 128) * 64 + (l_1_3 - 128)
end

l_0_4 = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_1, l_0_2
  local l_2_1 = {}
  l_2_1[120064] = "w"
  l_2_1[120065] = "x"
  l_2_1[120066] = "y"
  l_2_1[120067] = "z"
  if l_2_1[l_2_0] then
    return "FrakturAltForm", l_2_1[l_2_0]
  end
  for l_2_5,l_2_6 in ipairs(l_0_1) do
    if l_2_6.upper_start and l_2_6.upper_start <= l_2_0 and l_2_0 < l_2_6.upper_start + 26 then
      return l_2_6.name, (string.char)(l_2_0 - l_2_6.upper_start + (string.byte)("A"))
    else
      if l_2_6.lower_start and l_2_6.lower_start <= l_2_0 and l_2_0 < l_2_6.lower_start + 26 then
        return l_2_6.name, (string.char)(l_2_0 - l_2_6.lower_start + (string.byte)("a"))
      end
    end
  end
  for l_2_10,l_2_11 in ipairs(l_0_2) do
    if l_2_11.upper_start <= l_2_0 and l_2_0 < l_2_11.upper_start + 26 then
      return l_2_11.name, (string.char)(l_2_0 - l_2_11.upper_start + (string.byte)("A"))
    else
      if l_2_11.lower_start <= l_2_0 and l_2_0 < l_2_11.lower_start + 26 then
        return l_2_11.name, (string.char)(l_2_0 - l_2_11.lower_start + (string.byte)("a"))
      end
    end
  end
  return nil, nil
end

l_0_6 = 0
l_0_10 = 1
while 1 do
  while 1 do
    while 1 do
      l_0_11 = #l_0_0
      if l_0_10 <= l_0_11 then
        l_0_11, l_0_12 = l_0_0:byte, l_0_0
        l_0_13 = l_0_10
        l_0_11 = l_0_11(l_0_12, l_0_13)
        if l_0_11 == 226 then
          l_0_12 = l_0_10 + 2
          l_0_13 = #l_0_0
          if l_0_12 <= l_0_13 then
            l_0_12, l_0_13 = l_0_0:byte, l_0_0
            l_0_14 = l_0_10 + 1
            l_0_15 = l_0_10 + 2
            l_0_12 = l_0_12(l_0_13, l_0_14, l_0_15)
            l_0_14 = l_0_11 % 16
            l_0_14 = l_0_14 * 4096
            l_0_15 = l_0_12 % 64
            l_0_15 = l_0_15 * 64
            l_0_14 = l_0_14 + l_0_15
            l_0_15 = l_0_13 % 64
            l_0_14 = l_0_14 + l_0_15
            l_0_15 = l_0_4
            l_0_15 = l_0_15(l_0_14)
            do
              local l_0_16 = nil
              if l_0_15 and l_0_16 then
                if l_0_5[l_0_15] == nil then
                  l_0_5[l_0_15] = 0
                end
                l_0_5[l_0_15] = l_0_5[l_0_15] + 1
                l_0_6 = l_0_6 + 1
                ;
                (table.insert)(l_0_7, l_0_16)
                ;
                (table.insert)(l_0_9, l_0_16)
              end
              l_0_10 = l_0_10 + 3
              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    if l_0_11 == 240 then
      l_0_12 = l_0_10 + 3
      l_0_13 = #l_0_0
      if l_0_12 <= l_0_13 then
        l_0_12, l_0_13 = l_0_0:byte, l_0_0
        l_0_14 = l_0_10 + 1
        l_0_15 = l_0_10 + 3
        l_0_12 = l_0_12(l_0_13, l_0_14, l_0_15)
        l_0_15 = l_0_3
        l_0_15 = l_0_15(l_0_11, l_0_12, R18_PC179, R19_PC179)
        do
          local l_0_17, l_0_18 = l_0_4(l_0_15)
          if l_0_17 and l_0_18 then
            R18_PC179 = l_0_5[l_0_17]
            if R18_PC179 == nil then
              l_0_5[l_0_17] = 0
            end
            R18_PC179 = l_0_5[l_0_17]
            R18_PC179 = R18_PC179 + 1
            l_0_5[l_0_17] = R18_PC179
            l_0_6 = l_0_6 + 1
            R18_PC179 = table
            R18_PC179 = R18_PC179.insert
            R19_PC179 = l_0_7
            R18_PC179(R19_PC179, l_0_18)
            R18_PC179 = table
            R18_PC179 = R18_PC179.insert
            R19_PC179 = l_0_9
            R18_PC179(R19_PC179, l_0_18)
          end
          l_0_10 = l_0_10 + 4
          -- DECOMPILER ERROR at PC207: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC207: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC207: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC207: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  l_0_12, l_0_13 = l_0_0:sub, l_0_0
  l_0_14 = l_0_10
  l_0_15 = l_0_10
  l_0_12 = l_0_12(l_0_13, l_0_14, l_0_15)
  l_0_13, l_0_14 = l_0_12:match, l_0_12
  l_0_15 = "[%w]"
  l_0_13 = l_0_13(l_0_14, l_0_15)
  if l_0_13 then
    l_0_13 = table
    l_0_13 = l_0_13.insert
    l_0_14 = l_0_9
    l_0_15 = l_0_12
    l_0_13(l_0_14, l_0_15)
  end
  l_0_10 = l_0_10 + 1
end
if l_0_6 >= 1 then
  l_0_11 = 0
  l_0_12 = pairs
  l_0_13 = l_0_5
  l_0_12 = l_0_12(l_0_13)
  for l_0_15,i_2 in l_0_12 do
    if l_0_19 > 0 then
      l_0_11 = l_0_11 + 1
      -- DECOMPILER ERROR at PC242: Overwrote pending register: R18 in 'AssignReg'

      ;
      (mp.set_mpattribute)(R18_PC179)
      -- DECOMPILER ERROR at PC248: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC249: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC251: Overwrote pending register: R18 in 'AssignReg'

      if l_0_19 >= 4 then
        (mp.set_mpattribute)(R18_PC179)
      end
      -- DECOMPILER ERROR at PC257: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC258: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC260: Overwrote pending register: R18 in 'AssignReg'

      if l_0_19 >= 8 then
        (mp.set_mpattribute)(R18_PC179)
      end
      -- DECOMPILER ERROR at PC266: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC267: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC269: Overwrote pending register: R18 in 'AssignReg'

      if l_0_19 >= 15 then
        (mp.set_mpattribute)(R18_PC179)
      end
      -- DECOMPILER ERROR at PC275: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC276: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC278: Overwrote pending register: R18 in 'AssignReg'

      if l_0_19 >= 20 then
        (mp.set_mpattribute)(R18_PC179)
      end
    end
  end
  if l_0_11 >= 1 then
    (mp.set_mpattribute)("Lua:FnameNumberOfUnicodeStyles!" .. tostring(l_0_11))
  end
  if l_0_6 >= 4 then
    (mp.set_mpattribute)("Lua:FnameUnicodeStyleCharTotalCountGTE4")
  end
  if l_0_6 >= 8 then
    (mp.set_mpattribute)("Lua:FnameUnicodeStyleCharTotalCountGTE8")
  end
  if l_0_6 >= 15 then
    (mp.set_mpattribute)("Lua:FnameUnicodeStyleCharTotalCountGTE15")
  end
  if l_0_6 >= 20 then
    (mp.set_mpattribute)("Lua:FnameUnicodeStyleCharTotalCountGTE20")
  end
  local l_0_20 = nil
  if (table.concat)(l_0_7) ~= nil and #(table.concat)(l_0_7) >= 4 then
    (mp.set_mpattribute)("Lua:FnameUniStylePlain!" .. (string.lower)((table.concat)(l_0_7)))
    -- DECOMPILER ERROR at PC338: Confused about usage of register: R12 in 'UnsetPending'

    if (string.find)((string.lower)((table.concat)(l_0_7)), "code", l_0_20, true) ~= nil then
      (mp.set_mpattribute)("Lua:FnameUniStylePlainHasString!code")
    end
    -- DECOMPILER ERROR at PC351: Confused about usage of register: R12 in 'UnsetPending'

    -- DECOMPILER ERROR at PC353: Overwrote pending register: R16 in 'AssignReg'

    if (string.find)((string.lower)((table.concat)(l_0_7)), "pass", l_0_20, true) ~= nil then
      (mp.set_mpattribute)("Lua:FnameUniStylePlainHasString!pass")
    end
    -- DECOMPILER ERROR at PC364: Confused about usage of register: R12 in 'UnsetPending'

    -- DECOMPILER ERROR at PC366: Overwrote pending register: R16 in 'AssignReg'

    if (string.find)((string.lower)((table.concat)(l_0_7)), "password", l_0_20, true) ~= nil then
      (mp.set_mpattribute)("Lua:FnameUniStylePlainHasString!password")
    end
    -- DECOMPILER ERROR at PC377: Confused about usage of register: R12 in 'UnsetPending'

    -- DECOMPILER ERROR at PC379: Overwrote pending register: R16 in 'AssignReg'

    if (string.find)((string.lower)((table.concat)(l_0_7)), "install", l_0_20, true) ~= nil then
      (mp.set_mpattribute)("Lua:FnameUniStylePlainHasString!install")
    end
    -- DECOMPILER ERROR at PC390: Confused about usage of register: R12 in 'UnsetPending'

    -- DECOMPILER ERROR at PC392: Overwrote pending register: R16 in 'AssignReg'

    if (string.find)((string.lower)((table.concat)(l_0_7)), "setup", l_0_20, true) ~= nil then
      (mp.set_mpattribute)("Lua:FnameUniStylePlainHasString!setup")
    end
    -- DECOMPILER ERROR at PC403: Confused about usage of register: R12 in 'UnsetPending'

    -- DECOMPILER ERROR at PC405: Overwrote pending register: R16 in 'AssignReg'

    if (string.find)((string.lower)((table.concat)(l_0_7)), "download", l_0_20, true) ~= nil then
      (mp.set_mpattribute)("Lua:FnameUniStylePlainHasString!download")
    end
    -- DECOMPILER ERROR at PC416: Confused about usage of register: R12 in 'UnsetPending'

    -- DECOMPILER ERROR at PC418: Overwrote pending register: R16 in 'AssignReg'

    if (string.find)((string.lower)((table.concat)(l_0_7)), "update", l_0_20, true) ~= nil then
      (mp.set_mpattribute)("Lua:FnameUniStylePlainHasString!update")
    end
  end
  local l_0_21 = nil
  -- DECOMPILER ERROR at PC444: Overwrote pending register: R16 in 'AssignReg'

  if (table.concat)(l_0_9) ~= nil and #(table.concat)(l_0_9) >= 4 then
    (mp.set_mpattribute)("Lua:FnameUniStyleMix!" .. l_0_20)
  end
  return mp.INFECTED
end
do
  l_0_11 = mp
  l_0_11 = l_0_11.CLEAN
  do return l_0_11 end
  -- DECOMPILER ERROR at PC453: Confused about usage of register R15 for local variables in 'ReleaseLocals'

end

