-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17eb3163c40c9\0x00000e56_luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRollingQueueKeys("Medicated64Golang")
local l_0_1 = GetRollingQueueKeys("Medicated32Golang")
if l_0_0 or l_0_1 then
  local l_0_2 = nil
  if (this_sigattrlog[4]).matched and not isnull((this_sigattrlog[4]).utf8p2) then
    l_0_2 = (this_sigattrlog[4]).utf8p2
  else
    if (this_sigattrlog[5]).matched and not isnull((this_sigattrlog[5]).utf8p2) then
      l_0_2 = (this_sigattrlog[5]).utf8p2
    else
      if (this_sigattrlog[6]).matched and not isnull((this_sigattrlog[6]).utf8p2) then
        l_0_2 = (this_sigattrlog[6]).utf8p2
      else
        if (this_sigattrlog[7]).matched and not isnull((this_sigattrlog[7]).utf8p2) then
          l_0_2 = (this_sigattrlog[7]).utf8p2
        else
          if (this_sigattrlog[8]).matched and not isnull((this_sigattrlog[8]).utf8p2) then
            l_0_2 = (this_sigattrlog[8]).utf8p2
          else
            if (this_sigattrlog[9]).matched and not isnull((this_sigattrlog[9]).utf8p2) then
              l_0_2 = (this_sigattrlog[9]).utf8p2
            else
              if (this_sigattrlog[10]).matched and not isnull((this_sigattrlog[10]).utf8p2) then
                l_0_2 = (this_sigattrlog[10]).utf8p2
              end
            end
          end
        end
      end
    end
  end
  if l_0_2 then
    local l_0_3, l_0_4 = pcall(string.match, l_0_2, "Uri=([^;]+)")
    if not l_0_3 or isnull(l_0_4) then
      return mp.CLEAN
    end
    if not isValidLocalDomain(l_0_4) then
      local l_0_5 = {}
      l_0_5.SIG_CONTEXT = "BM"
      l_0_5.CONTENT_SOURCE = "SusGolang_C_SLIVER_C2"
      if (string.match)(l_0_4, "^https?://") then
        local l_0_6, l_0_7 = (mp.CheckUrl)(l_0_4)
        if l_0_6 == 1 and l_0_7 == 1 then
          return mp.CLEAN
        end
        local l_0_8 = SafeGetUrlReputation
        local l_0_9 = {}
        -- DECOMPILER ERROR at PC169: No list found for R9 , SetList fails

        -- DECOMPILER ERROR at PC170: Overwrote pending register: R10 in 'AssignReg'

        l_0_8 = l_0_8(l_0_9, l_0_4, false, 3000)
        l_0_9 = l_0_8.urls
        l_0_9 = l_0_9[l_0_4]
        if l_0_9 then
          l_0_9 = l_0_8.urls
          l_0_9 = l_0_9[l_0_4]
          l_0_9 = l_0_9.determination
          if l_0_9 ~= 1 then
            l_0_9 = l_0_8.urls
            l_0_9 = l_0_9[l_0_4]
            l_0_9 = l_0_9.confidence
            if l_0_9 ~= 90 then
              l_0_9 = bm
              l_0_9 = l_0_9.add_related_string
              l_0_9("[i] MALICIOUS URL: ", l_0_4, bm.RelatedStringBMReport)
              l_0_9 = add_parents
              l_0_9()
              l_0_9 = mp
              l_0_9 = l_0_9.INFECTED
              return l_0_9
            end
          end
        end
      end
    end
  end
end
do
  return mp.CLEAN
end

