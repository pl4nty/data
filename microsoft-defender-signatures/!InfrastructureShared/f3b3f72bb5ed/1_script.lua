-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f3b3f72bb5ed\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_2, l_0_5, l_0_7 = nil, nil, nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_1, l_0_4, l_0_6, l_0_9, l_0_12, l_0_15, l_0_18, l_0_21 = , (string.lower)((this_sigattrlog[1]).utf8p2)
  l_0_9 = bm
  l_0_9 = l_0_9.add_related_string
  l_0_12 = "process_cmdline"
  l_0_15 = l_0_4
  l_0_18 = bm
  l_0_18 = l_0_18.RelatedStringBMReport
  l_0_9(l_0_12, l_0_15, l_0_18)
else
  do
    do
      if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
        local l_0_3, l_0_8, l_0_11, l_0_14, l_0_17, l_0_20 = (string.lower)((this_sigattrlog[2]).utf8p2)
        l_0_14 = bm
        l_0_14 = l_0_14.add_related_string
        l_0_17 = "filemetadata"
        l_0_20 = l_0_3
        l_0_14(l_0_17, l_0_20, bm.RelatedStringBMReport)
        l_0_14 = bm
        l_0_14 = l_0_14.add_related_file
        l_0_17 = l_0_3
        l_0_14(l_0_17)
      end
      do
        if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
          local l_0_10, l_0_13, l_0_16, l_0_19, l_0_22 = , (string.lower)((this_sigattrlog[3]).utf8p2)
        else
        end
        -- DECOMPILER ERROR at PC93: Confused about usage of register: R2 in 'UnsetPending'

        if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (string.lower)((this_sigattrlog[4]).utf8p2) ~= nil then
          (bm.add_related_string)("parent_cmdline", (string.lower)((this_sigattrlog[4]).utf8p2), bm.RelatedStringBMReport)
        end
        local l_0_23, l_0_24 = nil
        for l_0_28,l_0_29 in ipairs(R6_PC102) do
          local l_0_25, l_0_26, l_0_27 = , (bm.get_process_relationships)()
          -- DECOMPILER ERROR at PC108: Confused about usage of register: R9 in 'UnsetPending'

          ;
          (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", R9_PC108.ppid)
        end
        addRelatedProcess()
        reportRelatedBmHits()
        return mp.INFECTED
      end
    end
  end
end

