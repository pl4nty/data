-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaELFOverlayPayload\0x00001de6_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 256 or l_0_0 > 15728640 then
  return mp.CLEAN
end
local l_0_7 = headerpage[5] == 2
local l_0_8 = headerpage[6] == 2
local l_0_9 = 0
-- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC44: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC51: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC72: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R3 in 'AssignReg'

if not l_0_7 or l_0_8 then
  if l_0_7 then
    local l_0_10 = nil
    if l_0_0 < l_0_9 + (mp.bswap16)(0) * (mp.bswap16)(0) + 128 then
      return mp.CLEAN
    end
    ;
    (mp.readprotection)(false)
    -- DECOMPILER ERROR at PC103: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC104: Confused about usage of register: R6 in 'UnsetPending'

    local l_0_11 = nil
    ;
    (mp.readprotection)(true)
    local l_0_12 = nil
    local l_0_13 = (mp.readfile)(l_0_9 + (mp.bswap16)(0) * (mp.bswap16)(0), l_0_0 - (l_0_9 + (mp.bswap16)(0) * (mp.bswap16)(0)))
    local l_0_14 = false
    local l_0_15 = 0
    local l_0_16 = {}
    local l_0_17 = {"\127ELF", "ELF"}
    local l_0_18 = {"PK\003\004", "ZIP1"}
    local l_0_19 = {"PK\a\b", "ZIP2"}
    local l_0_20 = {"7z��", "7Z"}
    -- DECOMPILER ERROR at PC137: No list found for R10 , SetList fails

    l_0_17 = ipairs
    l_0_18 = l_0_16
    l_0_17 = l_0_17(l_0_18)
    for l_0_20,i_2 in l_0_17 do
      -- DECOMPILER ERROR at PC142: Overwrote pending register: R16 in 'AssignReg'

      l_0_15 = ({"BZh", "BZIP"})(l_0_13, i_2[1], 1, 4096)
      if l_0_15 and l_0_15 >= 1 then
        (mp.vfo_add_buffer)(l_0_13:sub(l_0_15), "[ELFOverlay_" .. i_2[2] .. "]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
        l_0_14 = true
      end
    end
    if l_0_14 then
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC175: Confused about usage of register R14 for local variables in 'ReleaseLocals'

    -- DECOMPILER ERROR: 10 unprocessed JMP targets
  end
end

