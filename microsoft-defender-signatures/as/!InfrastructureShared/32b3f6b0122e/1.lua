-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3f6b0122e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "1bb146aa"
if (this_sigattrlog[1]).matched and not isnull((this_sigattrlog[1]).utf8p2) then
  local l_0_1 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  local l_0_2 = "app_ext_" .. l_0_1.Extension
  local l_0_3 = (MpCommon.AtomicCounterValueNamespaced)(l_0_2, l_0_0)
  if l_0_3 ~= nil then
    l_0_1.ACFilesEncrypted = l_0_3
    local l_0_4 = (MpCommon.AtomicCounterValueNamespaced)("rcount_sig_count", l_0_0)
    if l_0_4 ~= nil then
      l_0_1.SigCounter = l_0_4
    else
      l_0_1.SigCounter = 0
    end
    local l_0_5 = safeJsonSerialize(l_0_1)
    local l_0_6 = SafeGetUrlReputation
    local l_0_7 = {}
    -- DECOMPILER ERROR at PC45: No list found for R7 , SetList fails

    local l_0_8 = {}
    l_0_8.SIG_CONTEXT = "BM"
    l_0_8.CONTEXT_SOURCE = "GenRansomData3"
    l_0_8.TAG = "NOLOOKUP"
    -- DECOMPILER ERROR at PC54: No list found for R8 , SetList fails

    -- DECOMPILER ERROR at PC62: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC64: Overwrote pending register: R9 in 'AssignReg'

    if l_0_6 and l_0_7 == 3 then
      local l_0_9 = {}
      -- DECOMPILER ERROR at PC70: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC72: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC74: No list found for R9 , SetList fails

      -- DECOMPILER ERROR at PC76: Overwrote pending register: R6 in 'AssignReg'

    end
  end
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

