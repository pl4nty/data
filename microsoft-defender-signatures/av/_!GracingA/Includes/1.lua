-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!GracingA\Includes\1.luac 

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
    local l_0_8 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
    if isnull(l_0_8) then
      return mp.CLEAN
    end
    local l_0_9 = (mp.GetProcessCommandLine)(l_0_8)
    if isnull(l_0_9) then
      return mp.CLEAN
    end
    local l_0_10 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  for l_1_5 in (string.gmatch)(l_1_0, "http[s]?://[^\"%s]+") do
    (table.insert)(l_1_1, l_1_5)
  end
  return l_1_1
end

    local l_0_11 = l_0_10(l_0_9)
    l_0_11 = table_dedup(l_0_11)
    local l_0_12 = {}
    l_0_12.SIG_CONTEXT = "GoLang"
    l_0_12.CONTENT_SOURCE = "GOLANG_32_WITH_TEMPERED_PCLNTAB_MAGIC"
    for l_0_16,l_0_17 in ipairs(l_0_11) do
      if (string.match)(l_0_17, "^https?://") then
        local l_0_18, l_0_19 = (mp.CheckUrl)(l_0_17)
        if l_0_18 == 1 and l_0_19 == 1 then
          return mp.CLEAN
        end
        local l_0_20 = SafeGetUrlReputation
        local l_0_21 = {}
        -- DECOMPILER ERROR at PC97: No list found for R16 , SetList fails

        -- DECOMPILER ERROR at PC98: Overwrote pending register: R17 in 'AssignReg'

        l_0_20 = l_0_20(l_0_21, l_0_17, false, 3000)
        l_0_21 = l_0_20.urls
        l_0_21 = l_0_21[l_0_17]
        if l_0_21 then
          l_0_21 = l_0_20.urls
          l_0_21 = l_0_21[l_0_17]
          l_0_21 = l_0_21.determination
          if l_0_21 ~= 1 then
            l_0_21 = l_0_20.urls
            l_0_21 = l_0_21[l_0_17]
            l_0_21 = l_0_21.confidence
            if l_0_21 ~= 90 then
              l_0_21 = mp
              l_0_21 = l_0_21.IsTrustedFile
              l_0_21 = l_0_21(false)
              if l_0_21 == true then
                l_0_21 = mp
                l_0_21 = l_0_21.CLEAN
                return l_0_21
              end
              l_0_21 = mp
              l_0_21 = l_0_21.INFECTED
              return l_0_21
            end
          end
        end
      end
    end
  end
  do
    l_0_8 = mp
    l_0_8 = l_0_8.CLEAN
    return l_0_8
  end
end

