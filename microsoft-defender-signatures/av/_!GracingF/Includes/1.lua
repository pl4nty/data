-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!GracingF\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_mpattributevalue)("RPF:GoLang:pclntab_magic_unknown")
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC17: No list found for R1 , SetList fails

local l_0_2 = false
-- DECOMPILER ERROR at PC19: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC20: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in (4294967291)(4294967290) do
  if (mp.bitand)(l_0_0, l_0_7) ~= l_0_7 then
    l_0_2 = true
    break
  end
end
do
  if l_0_2 then
    local l_0_8, l_0_9 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_URL)
    if l_0_8 and not isnull(l_0_9) then
      local l_0_10 = {}
      l_0_10.SIG_CONTEXT = "GoLang"
      l_0_10.CONTENT_SOURCE = "ITW_GOLANG_32_WITH_TEMPERED_PCLNTAB_MAGIC"
      local l_0_11, l_0_12 = (mp.CheckUrl)(l_0_9)
      if l_0_11 == 1 and l_0_12 == 1 then
        return mp.CLEAN
      end
      local l_0_13 = SafeGetUrlReputation
      local l_0_14 = {}
      -- DECOMPILER ERROR at PC66: No list found for R9 , SetList fails

      -- DECOMPILER ERROR at PC67: Overwrote pending register: R10 in 'AssignReg'

      l_0_13 = l_0_13(l_0_14, l_0_9, false, 3000)
      l_0_14 = l_0_13.urls
      l_0_14 = l_0_14[l_0_9]
      if l_0_14 then
        l_0_14 = l_0_13.urls
        l_0_14 = l_0_14[l_0_9]
        l_0_14 = l_0_14.determination
        if l_0_14 ~= 1 then
          l_0_14 = l_0_13.urls
          l_0_14 = l_0_14[l_0_9]
          l_0_14 = l_0_14.confidence
          if l_0_14 ~= 90 then
            l_0_14 = mp
            l_0_14 = l_0_14.IsTrustedFile
            l_0_14 = l_0_14(false)
            if l_0_14 == true then
              l_0_14 = mp
              l_0_14 = l_0_14.CLEAN
              return l_0_14
            end
            l_0_14 = mp
            l_0_14 = l_0_14.INFECTED
            return l_0_14
          end
        end
      end
    end
  end
  do
    return mp.CLEAN
  end
end

