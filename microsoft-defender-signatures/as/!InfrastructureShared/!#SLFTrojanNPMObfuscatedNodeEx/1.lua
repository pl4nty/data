-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanNPMObfuscatedNodeEx\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 524288 or l_0_0 > 8388608 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil then
  return mp.CLEAN
end
if (string.sub)(l_0_1, -3) ~= ".js" and (string.sub)(l_0_1, -4) ~= ".mjs" and (string.sub)(l_0_1, -4) ~= ".cjs" then
  return mp.CLEAN
end
local l_0_2 = tostring(headerpage)
do
  if (string.find)(l_0_2, "while(!![])", 1, true) and (string.find)(l_0_2, "[\'push\'](", 1, true) then
    local l_0_3, l_0_5 = (string.find)(l_0_2, "[\'shift\']()", 1, true)
  end
  do
    if (string.find)(l_0_2, "\\x61\\x62\\x63\\x64\\x65\\x66", 1, true) then
      local l_0_4, l_0_6 = , (string.find)(l_0_2, "decodeURIComponent", 1, true)
    end
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC95: Confused about usage of register: R4 in 'UnsetPending'

    if not l_0_4 and not l_0_6 then
      return mp.CLEAN
    end
    ;
    (mp.readprotection)(false)
    local l_0_7 = nil
    ;
    (mp.readprotection)(true)
    if tostring((mp.readfile)(0, l_0_0)) == nil or #tostring((mp.readfile)(0, l_0_0)) ~= l_0_0 then
      return mp.CLEAN
    end
    if not (string.find)(tostring((mp.readfile)(0, l_0_0)), "\\x61\\x62\\x63\\x64\\x65\\x66", 1, true) or not (string.find)(tostring((mp.readfile)(0, l_0_0)), "decodeURIComponent", 1, true) or not (string.find)(tostring((mp.readfile)(0, l_0_0)), "execSync,spawn", 1, true) and not (string.find)(tostring((mp.readfile)(0, l_0_0)), "spawn,execSync", 1, true) then
      return mp.CLEAN
    end
    local l_0_8 = nil
    local l_0_9 = nil
    for l_0_13 = 1, #"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/" do
      local l_0_10, l_0_11 = , {}
      -- DECOMPILER ERROR at PC171: Confused about usage of register: R11 in 'UnsetPending'

      l_0_11[(string.sub)(l_0_10, R11_PC171, R11_PC171)] = R11_PC171 - 1
    end
    local l_0_16 = nil
    local l_0_17 = nil
    local l_0_18 = function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_r7
  local l_1_1 = {}
  for l_1_5 = 1, #l_1_0, 4 do
    local l_1_13, l_1_14 = nil
    l_1_13 = l_0_r7
    l_1_14 = string
    l_1_14 = l_1_14.sub
    l_1_14 = l_1_14(l_1_0, l_1_5, l_1_5)
    l_1_13 = l_1_13[l_1_14]
    local l_1_6, l_1_15 = nil
    l_1_14 = l_0_r7
    l_1_6 = string
    l_1_6 = l_1_6.sub
    l_1_15 = l_1_0
    l_1_6 = l_1_6(l_1_15, l_1_5 + 1, l_1_5 + 1)
    l_1_14 = l_1_14[l_1_6]
    local l_1_7, l_1_16 = nil
    l_1_6 = l_0_r7
    l_1_15 = string
    l_1_15 = l_1_15.sub
    l_1_7 = l_1_0
    l_1_16 = l_1_5 + 2
    l_1_15 = l_1_15(l_1_7, l_1_16, l_1_5 + 2)
    l_1_6 = l_1_6[l_1_15]
    local l_1_8, l_1_17 = nil
    l_1_15 = l_0_r7
    l_1_7 = string
    l_1_7 = l_1_7.sub
    l_1_16 = l_1_0
    l_1_8 = l_1_5 + 3
    l_1_17 = l_1_5 + 3
    l_1_7 = l_1_7(l_1_16, l_1_8, l_1_17)
    l_1_15 = l_1_15[l_1_7]
    local l_1_9, l_1_18 = nil
    if l_1_13 == nil or l_1_14 == nil then
      l_1_7 = nil
      return l_1_7
    end
    l_1_7 = #l_1_1
    l_1_7 = l_1_7 + 1
    local l_1_10, l_1_19 = nil
    l_1_16 = string
    l_1_16 = l_1_16.char
    l_1_8 = l_1_13 * 4
    l_1_17 = l_1_14 % 16
    l_1_17 = l_1_14 - l_1_17
    l_1_17 = (l_1_17) / 16
    l_1_8 = l_1_8 + l_1_17
    l_1_16 = l_1_16(l_1_8)
    l_1_1[l_1_7] = l_1_16
    if l_1_6 ~= nil then
      l_1_7 = #l_1_1
      l_1_7 = l_1_7 + 1
      l_1_16 = string
      l_1_16 = l_1_16.char
      l_1_8 = l_1_14 % 16
      l_1_8 = l_1_8 * 16
      l_1_17 = l_1_6 % 4
      l_1_17 = l_1_6 - l_1_17
      l_1_17 = (l_1_17) / 4
      local l_1_22 = nil
      l_1_8 = l_1_8 + l_1_17
      l_1_16 = l_1_16(l_1_8)
      l_1_1[l_1_7] = l_1_16
      if l_1_15 ~= nil then
        l_1_7 = #l_1_1
        l_1_7 = l_1_7 + 1
        l_1_16 = string
        l_1_16 = l_1_16.char
        l_1_8 = l_1_6 % 4
        l_1_8 = l_1_8 * 64
        l_1_8 = l_1_8 + l_1_15
        local l_1_21 = nil
        l_1_16 = l_1_16(l_1_8)
        local l_1_20 = nil
        l_1_1[l_1_7] = l_1_16
      end
    end
  end
  -- DECOMPILER ERROR at PC80: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  local l_1_11 = table.concat
  local l_1_12 = l_1_1
  do return l_1_11(l_1_12) end
  -- DECOMPILER ERROR at PC85: Confused about usage of register R3 for local variables in 'ReleaseLocals'

end

    do
      local l_0_19 = {}
      -- DECOMPILER ERROR at PC192: No list found for R9 , SetList fails

      -- DECOMPILER ERROR at PC193: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC194: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC195: Overwrote pending register: R12 in 'AssignReg'

      for i_1,i_2 in ({encoded = "C3bHD24", escaped = "\\x43\\x33\\x62\\x48\\x44\\x32\\x34", decoded = "spawn"})({encoded = "l3vWBg8", escaped = "\\x6c\\x33\\x76\\x57\\x42\\x67\\x38", decoded = "/uplo"}) do
        local l_0_20 = {encoded = "yxHPB3m", escaped = "\\x79\\x78\\x48\\x50\\x42\\x33\\x6d", decoded = "axios"}
        -- DECOMPILER ERROR at PC216: Confused about usage of register: R16 in 'UnsetPending'

        -- DECOMPILER ERROR at PC240: Confused about usage of register: R17 in 'UnsetPending'

        -- DECOMPILER ERROR at PC249: Confused about usage of register: R16 in 'UnsetPending'

        if ((string.find)(l_0_9, "\'" .. i_2.encoded .. "\'", 1, true) or (string.find)(l_0_9, "\"" .. i_2.encoded .. "\"", 1, true) or (string.find)(l_0_9, "\'" .. i_2.escaped .. "\'", 1, true) or (string.find)(l_0_9, "\"" .. i_2.escaped .. "\"", 1, true)) and l_0_18(i_2.encoded) == i_2.decoded then
          l_0_20 = l_0_20 + 1
        end
      end
      -- DECOMPILER ERROR at PC258: Confused about usage of register: R10 in 'UnsetPending'

      if l_0_20 ~= #l_0_19 then
        return mp.CLEAN
      end
      do return mp.INFECTED end
      -- DECOMPILER ERROR at PC266: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

