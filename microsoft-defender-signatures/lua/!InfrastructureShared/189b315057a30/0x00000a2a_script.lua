-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\189b315057a30\0x00000a2a_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC52: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p1 ~= nil then
      local l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p1)
    else
    end
    -- DECOMPILER ERROR at PC88: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p1 ~= nil then
        local l_0_2 = (string.lower)((this_sigattrlog[4]).utf8p1)
      else
      end
      -- DECOMPILER ERROR at PC124: Overwrote pending register: R0 in 'AssignReg'

      do
        if (not (this_sigattrlog[6]).matched or (this_sigattrlog[6]).utf8p1 == nil or (this_sigattrlog[7]).matched) and (this_sigattrlog[7]).utf8p1 ~= nil then
          local l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8 = (string.lower)((this_sigattrlog[6]).utf8p1)
        else
        end
        if not (this_sigattrlog[8]).matched or (this_sigattrlog[8]).utf8p1 == nil or (string.lower)((this_sigattrlog[8]).utf8p1) == nil then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC151: Confused about usage of register: R0 in 'UnsetPending'

        ;
        (bm.add_related_string)("file_metadata", (string.lower)((this_sigattrlog[8]).utf8p1), bm.RelatedStringBMReport)
        addRelatedProcess()
        reportRelatedBmHits()
        return mp.INFECTED
      end
    end
  end
end

