-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\12cb3d5fb444d\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1, l_0_6, l_0_8, l_0_12, l_0_14 = nil, nil
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
    local l_0_2 = nil
    if not (this_sigattrlog[1]).utf8p2 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

  end
  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 then
      local l_0_3, l_0_4, l_0_5, l_0_7, l_0_9, l_0_10, l_0_11, l_0_13 = ((this_sigattrlog[2]).utf8p1):match("([^\\]+)$"), ((this_sigattrlog[1]).utf8p2):match("create(.*)binpath")
    end
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R1 in 'UnsetPending'

    if ((this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 and not ((this_sigattrlog[3]).utf8p1):match("([^\\]+)$")) or not l_0_4 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC64: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

    if contains(l_0_4, ((this_sigattrlog[3]).utf8p1):match("([^\\]+)$")) then
      (bm.add_related_string)("RegisteredSrv", ((this_sigattrlog[3]).utf8p1):match("([^\\]+)$"), bm.RelatedStringBMReport)
      local l_0_15 = nil
      if reportRelevantUntrustedEntities(0) and next(reportRelevantUntrustedEntities(0)) then
        (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(reportRelevantUntrustedEntities(0)), bm.RelatedStringBMReport)
      end
      return mp.INFECTED
    end
    do
      return mp.CLEAN
    end
  end
end

